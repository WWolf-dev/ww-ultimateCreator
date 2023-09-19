window.addEventListener('message', function (event) {
    const data = event.data;

    switch (data.type) {
        case 'creator':
            if (data.status) {
                document.getElementById('interface').style.display = 'block';

                const nameElement = document.getElementById('welcome_text');
                nameElement.textContent = `Welcome ${data.playerName}`;

                const groupElement = document.getElementById('group_text'); // Assurez-vous que cet élément existe
                groupElement.textContent = `Group: ${data.playerGroup}`;
            } else {
                document.getElementById('interface').style.display = 'none';
            }
            break;
        // ... vos autres cas
    }
});



document.getElementById('leave_button').addEventListener('click', function () {
    // Fermez la fenêtre HTML
    document.getElementById('interface').style.display = 'none';

    // Utilisez axios pour envoyer une requête POST
    axios.post(`https://${GetParentResourceName()}/closeInterface`, { type: 'closeInterface' })
        .then(response => {
            console.log('Réponse reçue:', response.data);
        })
        .catch(error => {
            console.error('Erreur lors de l\'envoi du message:', error);
        });
});

document.getElementById('side_blips_button').addEventListener('click', function () {
    // Fermez la fenêtre HTML
    document.getElementById('interface').style.display = 'none';

    // Utilisez axios pour envoyer une requête POST
    axios.post(`https://${GetParentResourceName()}/goIntoBlipBuilder`, { type: 'sideBlips' })
        .then(response => {
            console.log('Réponse reçue:', response.data);
        })
        .catch(error => {
            console.error('Erreur lors de l\'envoi du message:', error);
        });
});
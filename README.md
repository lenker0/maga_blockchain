# Описание контракта

Это смарт-контракт, написанный на Solidity, который позволяет людям регистрироваться и голосовать. Контракт отслеживает, был ли адрес уже зарегистрирован для голосования или нет, используя отображение адресов на булевы значения. Контракт также использует тип enum для отслеживания статуса избирателя: "Зарегистрирован" или "Проголосовал". Контракт состоит из трех основных функций: Register() для регистрации для голосования, Vote() для голосования и Status() для получения текущего статуса избирателя. Функция Register() проверяет, началось ли уже голосование, зарегистрировался ли отправитель для голосования, и если нет, регистрирует отправителя для голосования. Функция Vote() проверяет, зарегистрирован ли отправитель для голосования, и если голосование еще не закончилось, то устанавливает статус отправителя на "Проголосовал". Функция Status() возвращает текущий статус отправителя, либо "Зарегистрирован", либо "Проголосовал". Наконец, контракт испускает два события, LogNewRegistration и LogNewVote, чтобы уведомить соответствующие стороны о новой регистрации или голосовании.

## Бизнес-задача
Бизнес-целью этого смарт-контракта может быть его использование для проведения безопасного и прозрачного онлайн-голосования на политических выборах. Смарт-контракт может быть использован для регистрации избирателей, предоставления им возможности безопасно отдать свой голос и ведения учета всех поданных голосов. Это поможет снизить вероятность мошенничества на выборах и обеспечить справедливость и прозрачность процесса голосования. Кроме того, смарт-контракт может быть использован для автоматизации подсчета голосов и устранения необходимости ручного подсчета голосов, который может отнимать много времени и быть чреват ошибками

В этом смарт-контракте нет конкретной логики, которая определяла бы, каким образом решение принимается или кто может голосовать. Он предоставляет только базовую функциональность для регистрации избирателей и голосования.

Если вы хотите использовать этот контракт для проведения выборов, вы можете добавить свою логику принятия решений и критерии для определения, какой кандидат или предложение победили.

Например, вы можете добавить дополнительные функции в контракт для подсчета голосов и определения победителя. Решение может быть принято на основе большинства голосов или какой-то другой методологии, определяющей победителя. Кроме того, вы можете установить критерии для того, кто может голосовать, например, только зарегистрированные избиратели, обладающие определенными правами.

Независимо от выбранных критериев, важно убедиться, что ваше решение соответствует законодательству и требованиям вашей страны или региона.

## Описание тестов

Блок контракта с четырьмя тестами, которые охватывают основную функциональность контракта голосования:

"should initialize with the status Registered": проверяет, что контракт инициализируется со статусом, установленным на Registered.
"should allow a voter to register": проверяет, что избиратель может успешно зарегистрироваться и что соответствующее событие испускается.
"should not allow a voter to register twice": проверяет, что избиратель не может зарегистрироваться дважды и что выдается соответствующее сообщение об ошибке.
"should not allow a voter to vote twice": проверяет, что избиратель не может отдать более одного голоса, и что выдается соответствующее сообщение об ошибке.

# Пример деплоя и тестов

![image](https://user-images.githubusercontent.com/43700151/227236532-71dd9e27-8922-44e1-84f4-c69cc1e72f4d.png)
![image](https://user-images.githubusercontent.com/43700151/227236620-c683500f-702d-467d-aee8-8ce90dfc7ad8.png)
![image](https://user-images.githubusercontent.com/43700151/227236652-688430d0-52ca-4b42-8593-066fe7b426e9.png)

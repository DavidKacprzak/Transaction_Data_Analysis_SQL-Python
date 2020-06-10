SELECT * FROM transaction;

SELECT *
FROM card_holder ch
JOIN credit_card cc
ON (ch.id = cc.id_card_holder)
JOIN transaction t
ON (cc.card = t.card)
WHERE cc.id_card_holder = 2
OR cc.id_card_holder = 18;


SELECT * FROM card_holder ch 
JOIN credit_card cc ON (ch.id = cc.id_card_holder) 
JOIN transaction t ON (cc.card = t.card);


SELECT * FROM merchant_category mc 
JOIN merchant m ON (mc.id = m.id_merchant_category) 
JOIN transaction t ON (m.id = t.id_merchant)
JOIN credit_card cc ON (t.card = cc.card)
JOIN card_holder ch ON (cc.id_card_holder = ch.id);


SELECT * FROM merchant_category mc 
JOIN merchant m ON (mc.id = m.id_merchant_category) 
JOIN transaction t ON (m.id = t.id_merchant)
JOIN credit_card cc ON (t.card = cc.card)
JOIN card_holder ch ON (cc.id_card_holder = ch.id)
WHERE cc.id_card_holder = 25 AND date BETWEEN '2018-01-01' AND '2018-07-01';
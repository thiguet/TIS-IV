﻿const setDefaultDate = fieldQuerySelector => {
    $(fieldQuerySelector).val(moment().format("DD/MM/YYYY"));
};

const setReadOnly = fieldQuerySelector => {
    $(fieldQuerySelector).prop('readonly', true);
};

const validateDateFormField = fieldQuerySelector => {
    return $(fieldQuerySelector).change(() => {
        const informedDate = $(fieldQuerySelector).val();

        if (!(moment(informedDate, "DD/MM/YYYY").isValid() ||
              moment(informedDate, "YYYY-MM-DD").isValid())) {
            setInvalidField(fieldQuerySelector);
        } else {
            cleanInvalidField(fieldQuerySelector);
        }
    });
};

const validateNumericRequiredFormField = (fieldQuerySelector, isInteger = false, setParsedValue = false) => {
    return $(fieldQuerySelector).change(() => {
        let value;
        if (isInteger)
            value = parseInt($(fieldQuerySelector).val());
        else
            value = parseFloat($(fieldQuerySelector).val()).toFixed(3).replace(".", ",");

        if (Number.isNaN(parseFloat(value))) { 
            setInvalidField(fieldQuerySelector);
        } else {
            if (setParsedValue)
                $(fieldQuerySelector).val(value);
            cleanInvalidField(fieldQuerySelector);
        }
    });
};

const validateRequiredFormField = fieldQuerySelector => {
    return $(fieldQuerySelector).change(() => {
        const value = $(fieldQuerySelector).val();

        if (!value) {
            setInvalidField(fieldQuerySelector);
        } else {
            cleanInvalidField(fieldQuerySelector);
        }
    });
};

const setInvalidField = fieldQuerySelector => {
    $(fieldQuerySelector).css("border-color", "red");
};

const cleanInvalidField = fieldQuerySelector => {
    $(fieldQuerySelector).css("border-color", "");
};


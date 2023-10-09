Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B14F17745
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 14:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8+GAxZK"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so8110149a12.1
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 07:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696863344; x=1697468144; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j46zcTawL9T8Eu71NYkiSsHKaV8Y8edTrMAxgjTz/ZA=;
        b=f8+GAxZKd9ZzqnR5KCeAT4bvsK/ef/rZu4jAeVWQ8BOuRv4SehoB7TJOhP16rw9HoS
         n7QAgzKmDjpQvT1YlG7T7Ozeb/ZdIub3uxJ6bgMU9bPiyPgs2sq68foxJXuFRLgS0nY8
         KC7Zo/Z7jSUvKi7QdLHa8Cpd5ZcJCRIS70JJkAVojNPVCheR8aGBl1gZT5aAfN9oIJvf
         EtWlMY5HRtTa8ymzlrjTNbwW6j/Lf+tbrRlRgQ7AfMuRrFUJMN7o/juVPjG83EmxIlYK
         NCmAZzr1DOgaJiRWx2G1obbPKp6Mw1ZfJg5NeClJwpWlTo86RxY16PdHCireiTzPfD/S
         9OlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696863344; x=1697468144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j46zcTawL9T8Eu71NYkiSsHKaV8Y8edTrMAxgjTz/ZA=;
        b=lLQpeczkt/3f5/V6eUefI5hkxnMwwuO2Zo2Ut+LhIdsK/9DtyNAc4gufdsjw2U66nn
         0JJkhQzMCnhMsI/Pm0+1sgYbK8uWkjUgrpZPz65OZ5GQBTwhc0FtyT+6hPRMM4ZRXM6z
         AgXYM+VMSrEh6LXxaGlHtTuCagQUpwjynCz4MP+GfknCQ3UXEnYPAPGJ0MiHptj2cEgY
         OEkOHs3fjiP+MLMjKlSPtHzHEIjuvTWz+JrwWVL85J+wo+hkzAQyOWo9kFwhWdH1TeXC
         u0TF95qNXZ4wWDpJiw6Ig1SIpFkcu5Mp3P+6Tvd0j0nUU3/AZLqp7zPsuvCj/U69tnPo
         EGJg==
X-Gm-Message-State: AOJu0YysIkgKVORogxeB6am/bLebqw2w3NarehZuah0Byyo2lGYoDTOk
	H41B0m8WNzFRJJHPSfkmHkXmHCG1NkHdCaOpvk4=
X-Google-Smtp-Source: AGHT+IG/gvihxcr0lSXmqhzAg7KinQRPWFPXtOnHdValzaFrait68oMnzm14gRBytChi/uOqO5waYy/elg9FWzQgwsw=
X-Received: by 2002:aa7:d506:0:b0:533:23e2:c48 with SMTP id
 y6-20020aa7d506000000b0053323e20c48mr13245977edq.3.1696863344225; Mon, 09 Oct
 2023 07:55:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231006201719.work.356-kees@kernel.org>
In-Reply-To: <20231006201719.work.356-kees@kernel.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 9 Oct 2023 10:55:32 -0400
Message-ID: <CAKf6xptEEHJAsrwh_oebK1_AMb+_tvLtiY8sP-Qk=Z9jXhVf7Q@mail.gmail.com>
Subject: Re: [PATCH] wifi: p54: Annotate struct p54_cal_database with __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: Christian Lamparter <chunkeey@googlemail.com>, Kalle Valo <kvalo@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-wireless@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I randomly peeked at this patch.  Unfortunately, I am not familiar
with the actual p54 code.

On Fri, Oct 6, 2023 at 4:17=E2=80=AFPM Kees Cook <keescook@chromium.org> wr=
ote:
>
> Prepare for the coming implementation by GCC and Clang of the __counted_b=
y
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct p54_cal_database=
.
>
> Cc: Christian Lamparter <chunkeey@googlemail.com>
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-wireless@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples=
/counted_by.cocci [1]
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/net/wireless/intersil/p54/p54.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/intersil/p54/p54.h b/drivers/net/wirele=
ss/intersil/p54/p54.h
> index 3356ea708d81..770e348d1f6c 100644
> --- a/drivers/net/wireless/intersil/p54/p54.h
> +++ b/drivers/net/wireless/intersil/p54/p54.h
> @@ -126,7 +126,7 @@ struct p54_cal_database {
>         size_t entry_size;
>         size_t offset;
>         size_t len;
> -       u8 data[];
> +       u8 data[] __counted_by(entries);

This looks incorrect - I think you want __counted_by(len)?  The
presence of entry_size made me suspicious.

>  };

This is the function that creates struct p54_cal_database:

static struct p54_cal_database *p54_convert_db(struct pda_custom_wrapper *s=
rc,
                                               size_t total_len)
{
        struct p54_cal_database *dst;
        size_t payload_len, entries, entry_size, offset;

        payload_len =3D le16_to_cpu(src->len);
        entries =3D le16_to_cpu(src->entries);
        entry_size =3D le16_to_cpu(src->entry_size);
        offset =3D le16_to_cpu(src->offset);
        if (((entries * entry_size + offset) !=3D payload_len) ||
             (payload_len + sizeof(*src) !=3D total_len))
                return NULL;

        dst =3D kmalloc(sizeof(*dst) + payload_len, GFP_KERNEL);
        if (!dst)
                return NULL;

        dst->entries =3D entries;
        dst->entry_size =3D entry_size;
        dst->offset =3D offset;
        dst->len =3D payload_len;

        memcpy(dst->data, src->data, payload_len);
        return dst;
}

You can see that kmalloc is performed with `sizeof(*dst) +
payload_len`, and payload_len is assigned to ->len.

I don't read Coccinelle, but, if this patch was auto-generated, I
wonder if the script has an error.

Regards,
Jason

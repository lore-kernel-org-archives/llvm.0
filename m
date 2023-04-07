Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF38882C
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 18:28:04 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id g3so264559pja.2
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 11:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680892083; x=1683484083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=racKSQFJw6htxGvl8wL9wTMwQ/BfxK72fBbPH3jrfzo=;
        b=q7Wm05yAXnSdYgLlHZrk+vSMJLG7IwbD5WNTN2nFku16vITT4ZPAtf5KS9mPxIa99m
         KDfOJdihPQ1164fFyY3YqTPPOWuusIcdkUrKaRuyIq7PR0uMFQBh3Y0e82P0CbvR0cNa
         KsKhHw81I8FMbcib5C6wFXXhdaqoihXftB7DHPg/TV3vKbqI5kNriwt7bhPm2Sj6sIOO
         j5tKKaoWBl0+mLS5lpixAw92WKEsDItL7rhFvwYIbeFIrG9/qNe2cwuoFq9RyOZJX+MU
         0N2hu+SHtyJBxahfkPydyCZ1eGhSoRYIct9meRQa2GdsQZ1nwN9pPjlJ+LuXihUPB/Hv
         aVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680892083; x=1683484083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=racKSQFJw6htxGvl8wL9wTMwQ/BfxK72fBbPH3jrfzo=;
        b=MOt0mhPTCPAjPMZpiQi4MmJe4AHbEtmWOvy+uUviFJ1/dbZ3hckQCUgpfdOj4xL6Qq
         bUbU+ZGzBJrGoyLCKQkELal7H4TywkjRBUpohFUx3W5cdoIU6ZbzD9Mo9fMKG3p4o93q
         8uVWK7fv9zmreo19efibaXkYoXKas5Qe3K6UJc9o8YVDN7Um/H6De1QTeliz1TsKnWH9
         ZtS/yT6Kfvf1JnG66gH8SZztUxrL+qEreTsMeFUHQWyodkz9IA8K0pNC+STikQvcGndF
         OOUSAVPn+4aCEIzpbty46aq/TjaKjbKgJeiTWxAXfPoswURbKNbj7vZXGerx8dec9Aen
         fWYw==
X-Gm-Message-State: AAQBX9dFIg+b6RcV6SbZsObdUaJAQPtShju4aGI9/B3ULjt7RH1phEJI
	BU2+eGMy9MzGkkzys85vtqmeC5LF85cp/oi5Sx15Yw==
X-Google-Smtp-Source: AKy350aRREn50bpQ7xCS9LErMRNVeVNQfFgxRLmHVwVs/Hhc6bXBF8o0SRAxqojHcFOrhX1MsA8ejh9JM3OYefgOccs=
X-Received: by 2002:a17:902:da85:b0:19f:2aa4:b1e5 with SMTP id
 j5-20020a170902da8500b0019f2aa4b1e5mr1216879plx.2.1680892083395; Fri, 07 Apr
 2023 11:28:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230401010456.1866555-1-trix@redhat.com>
In-Reply-To: <20230401010456.1866555-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 11:27:52 -0700
Message-ID: <CAKwvOdkzW41CXskgY8h6V321kQyDv8DjvYC02YdK71QKEB2g=Q@mail.gmail.com>
Subject: Re: [PATCH] [media] mb86a20s: remove unused active_layers variable
To: Tom Rix <trix@redhat.com>
Cc: mchehab@kernel.org, nathan@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 6:05=E2=80=AFPM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/media/dvb-frontends/mb86a20s.c:1572:6: error: variable
>   'active_layers' set but not used [-Werror,-Wunused-but-set-variable]
>         int active_layers =3D 0, pre_ber_layers =3D 0, post_ber_layers =
=3D 0;
>             ^
> This variable is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks for the patch!
Fixes: 149d518ad0fd ("[media] mb86a20s: add BER measurement")
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/media/dvb-frontends/mb86a20s.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/media/dvb-frontends/mb86a20s.c b/drivers/media/dvb-f=
rontends/mb86a20s.c
> index b74b9afed9a2..125fed4891ba 100644
> --- a/drivers/media/dvb-frontends/mb86a20s.c
> +++ b/drivers/media/dvb-frontends/mb86a20s.c
> @@ -1569,7 +1569,7 @@ static int mb86a20s_get_stats(struct dvb_frontend *=
fe, int status_nr)
>         u32 t_post_bit_error =3D 0, t_post_bit_count =3D 0;
>         u32 block_error =3D 0, block_count =3D 0;
>         u32 t_block_error =3D 0, t_block_count =3D 0;
> -       int active_layers =3D 0, pre_ber_layers =3D 0, post_ber_layers =
=3D 0;
> +       int pre_ber_layers =3D 0, post_ber_layers =3D 0;
>         int per_layers =3D 0;
>
>         dev_dbg(&state->i2c->dev, "%s called.\n", __func__);
> @@ -1589,9 +1589,6 @@ static int mb86a20s_get_stats(struct dvb_frontend *=
fe, int status_nr)
>
>         for (layer =3D 0; layer < NUM_LAYERS; layer++) {
>                 if (c->isdbt_layer_enabled & (1 << layer)) {
> -                       /* Layer is active and has rc segments */
> -                       active_layers++;
> -
>                         /* Handle BER before vterbi */
>                         rc =3D mb86a20s_get_pre_ber(fe, layer,
>                                                   &bit_error, &bit_count)=
;
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers

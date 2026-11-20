Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795196136;
	b=ZtqVZxve+4yHUF/LFyoMb3G6A09s/vtWqpv09qFIOnoHUUDH9VJSQ7YWSqAjKcbIdS8P
	 ndsP4hABSs/LQ7hpZ8YIl+V/5CuNpZdOlJso3BFm/R6copGJxmwXljnJUbN+yHPwoZwUt
	 9ATy2MI0RmFpSLjIC6XB+81zxJ1/Vr/5M6ONUWE4Y09rkdEkIkHUyeU2kCP64qsfreQzm
	 Xgu4UlQYoBI15ApIJ6f7y2lVp7NqoAGvQgHs3RkKMMEEARzDQSbBa9JW0PekSolD7RsXj
	 zuvrXqlzyFH4RPIHFz892sFNZD7qa+6ERAfog5kOK1/8V7wbHuadqAKFAR2z6HPCKaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Sg9wdreYArJWqO177axMWEVER4eAxW9Ay7LMmq1t6Eo=;
	b=zJf3x52ST1PIZ6VrUlzOil5tekoPQTgvqp2n4dmtzHVME+sypfBMkceHa7Z6HrJIo1nh
	 dxK1xc+Nj7uoWFaBdh+3qPbL0jm6/5iPzYtJ1KeSSNo0cd/B4ag+QJ02ucxQ9QXPJOyO6
	 WCla0OghQ+1cm9y/sPCJYc9rTBsgnzrM4H1PFddwhpoJYnsrb7PkuJX/DwOn68nW+sLxA
	 Wz5IOWXC2c/JVVtF8cBXNifK0WUy0/kZHd/TZxtAewwcuSvPp/fJdRH9E7Z2gZ/MuTqKm
	 X0SVjPsmqyg0nhPJ2lrRdF1eCmoIh0QnoWUf/O/7nP37NKbX13jd1GGPBz779+ysI9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JsFGCc5a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EFC60A2630
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 17:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39EFC60A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JsFGCc5a
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55be673e029so308661cf.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 09:35:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795196134; cv=none;
        d=google.com; s=arc-20260327;
        b=kzk8dnZOasCggp2xkDB5NWQBI4NK8lirQhtRA1Tdx5LVSY30IIuNPjZPpG/IjEOibE
         MrNUjDuHZrTedJ+MRJ+FyLQ+3YeJZr59GF8O0adCTow58W8nQo4CG4N8/WzFAeDfdKSV
         8VT0W5RcxCYKMmtX6PKuXwjQMXRbupeyPKQbo+sFLHvIdjzobpos5FZ07VyjNHlQM4fc
         Oi4h+IUlFHaYXOYbpNuDzqgDclu3AoWAiUEMSwZaf60HlM3WJ9/Mw4kkkkYA4wQ2gb4Y
         D//hCGV3JkKHS2UzQExqBeqOqXDrBy+KeiuZfwns2g4ZONM0WvHRAzf3A8sQoaKCwsmb
         XEQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sg9wdreYArJWqO177axMWEVER4eAxW9Ay7LMmq1t6Eo=;
        fh=E3qlk57KmyDhtjveNuYQiRYn2/Nfctzz/rw2EXfYqo4=;
        b=QMjgAYXfjXDFBOBAD2ixW9WvtYQFV8qK751FBkftRaGPjQbRsz/mTFaOk+R3j1YlfC
         oLz2bYBttr9obSOGlU9ROQRm5jLjdMnh2kG4EUf0qXKs3NcOKaWlL6cfdEsE/1yG5IxL
         9eaOs6I2V7dHGJ3mZwbZHZhJdpkEhMQM6PVg7Ii7QdhwgJFsV1BHa8W4jph8RsN4BQgf
         D1dcvCtOO32imDKH/64tLcGu1LAebpT9l79vkqEAqyzXiyMkT9DTMjlFrTH36UpBtsdB
         c2hQqwSizgbhwfPwBCIfHtFVlRXfPK4RLgznU6aZaJunudS7PaLXRX3QVbhycbg88Pxg
         NZjg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795196134; x=1795800934; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sg9wdreYArJWqO177axMWEVER4eAxW9Ay7LMmq1t6Eo=;
        b=JsFGCc5atOxsgyd+jaYwxTXG8ItYIfsg2XMDHeHKLbPkrrV+f5h5dobGch4OsJ17AO
         xhgWIS6lwv36L+XIZUkQ+RU2ZzblIEMaP9CexrI+GDy/sVO5/id6U9nMqCgTI0BSl6TV
         PYPodCuRSuEsIMUrE3y8V/yg3VGqRvD5nRfjiMbmNXdr/gbkDyZs6/H8HR94hlfktgJ8
         m3YXEjxtYrdi1KkrYW9zBPifbJ0EQo1RA5G8+yVWJFb0l/LQSPT1RzqqUdxhQdAMNkIx
         X3W++wbOBxLEVBCp2LvuKHUJeDSccfmODb7iYoNISoPJmH8wy1QcgjAwwRL4b2fSmQpk
         2yVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196134; x=1795800934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sg9wdreYArJWqO177axMWEVER4eAxW9Ay7LMmq1t6Eo=;
        b=FKvbMt4RAHq0Tu/t0ZRPBbVGugSR8+un2gThdJYlL/sL27e44qOeeJNO/kc1pHFqxa
         cU1U4t0/qC6GCP3LCTJMM0VihQybTjyscquF3xvcAQB7smuwa6lUETVGsHdqCXWlhBxg
         pTUP9C3W+Sf0RfB+sITnAO41YOdgDzGPaIPLAbzqDBLbnn9m6hJ789aele21PUxZD9x3
         3eriKNUM21thezuftht+SlKbyk+ORVCW3ydEWpL7H1CkG7X0XlYWo4zwnmXr1fQg0G5Y
         AHoffi18JJgVep5OSA04AS9RMFYIpH+80VcSCNw3Icz2JVYtIJgHbHqb3AMx6nGMxhpW
         J4EQ==
X-Forwarded-Encrypted: i=1; AL+hErFMgp3FnfG7t+Tr9HP1z0TYp6XYIIyJcMZ6h0cYC6IWDwp+kXH9BdB72Bsgp3GP8GPORGj9@lists.linux.dev
X-Gm-Message-State: APuU4Z8yoSHqVpGCPSNLZW3bYUIbL/6qWJ3OXTUW57qTg3gg7YXCvW1V
	3pfL8LQUy80WPzD0x6pgAPhGut6VQ92mSTLWRL8e9ZaDqHoYAaKwJSzTE1boXssAcdSj0LDYfH9
	4052KA4ceZRsp6lKRQ+WQisXhE0JtwhWmZenyYd5h
X-Gm-Gg: AZFdTZdFeAfkNDZSr8RUHogX3ccv9EdUF3hrMLTaJv54ixPM5bqFBqfSiDWwWVhOk5K
	URHhHZcwPmagpliiPufiMexQdvWvGVcR3rqqkNUq4aO8Upw3sv2DUmPtBoDndvmzhBzIUS+t8B3
	X6GERiClZk2FmCgKh+qHL9q41J7GvkgeRLt/fr308Ff17x+GSAZpt+vZDIx9pLDb1ZgrwyW3/Ik
	McAHn8ghmvTX/xnNKFxdBnZuekiDMOvNOhLmfV2at1GjWvBZIYX8iVAUUHnlS4iE3lZkUqZnhRx
	ZYl27sYVsu1rX4d63dutIe3hrueyztskjvp7KxMJcWYWj29V6BFQF5sNEGhN/nu9Ck08vlLRAUX
	hWQNBGzUNQvvK9prThxS/8aFZoyTp7q2ymbVm
X-Received: by 2002:ac8:5c8b:0:b0:535:30a:76c7 with SMTP id
 d75a77b69052e-55d790b2edemr23784471cf.3.1795196133385; Fri, 20 Nov 2026
 09:35:33 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119171014.1534691-1-irogers@google.com> <f712f16f-dd35-4afc-81db-4e93232846aa@bootlin.com>
In-Reply-To: <f712f16f-dd35-4afc-81db-4e93232846aa@bootlin.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:35:20 -0800
X-Gm-Features: Aa3M54rHxE2SNl4cgtQPI_-lngqTQPH9-vUoYkTGGDewMSKBXdmwHC7t9x76wtU
Message-ID: <CAP-5=fUPWc5GH6BQsN-+Di=LVb=dYcUu5Mo04Rp2ugsMzjYFEg@mail.gmail.com>
Subject: Re: [PATCH net] net: pse-pd: pd692x0: Return fw_upload_err codes from
 firmware upload ops
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:26=E2=80=AFAM Kory Maincent <kory.maincent@bootli=
n.com> wrote:
>
>
>
> On 11/19/26 18:10, Ian Rogers wrote:
> > pd692x0_fw_reset() and pd692x0_fw_write() return negative errno values
> > from i2c_master_send() directly as enum fw_upload_err instead of
> > FW_UPLOAD_ERR_RW_ERROR, and pd692x0_fw_recv_resp() ignores negative
> > errors from its trailing i2c_master_recv(). When a negative errno is
> > propagated to the firmware upload core, fw_upload_error() rejects it
> > as >=3D FW_UPLOAD_ERR_MAX, logs an invalid error code message, and
> > reports "unknown-error" instead of "read-write-error" via sysfs.
> >
> > Return FW_UPLOAD_ERR_RW_ERROR on I2C transfer failures and use
> > enum fw_upload_err consistently across the PD692x0 firmware upload
> > helpers.
>
> Please write a readable commit message with human hands.
>
> > Found via Clang -Wimplicit-int-enum-cast on an x86_64 allyesconfig
> > build. Verified by building drivers/net/pse-pd/pd692x0.o with LLVM=3D1
> > W=3D1 (-Werror) and -Wimplicit-int-enum-cast, and with a standalone C
> > reproducer; not runtime-tested on PD692x0 hardware.
> >
> > Fixes: 9a9938451890 ("net: pse-pd: Add PD692x0 PSE controller driver")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >   drivers/net/pse-pd/pd692x0.c | 81 ++++++++++++++++++-----------------=
-
> >   1 file changed, 40 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/net/pse-pd/pd692x0.c b/drivers/net/pse-pd/pd692x0.=
c
> > index 7958f5741463..94a857eaa3de 100644
> > --- a/drivers/net/pse-pd/pd692x0.c
> > +++ b/drivers/net/pse-pd/pd692x0.c
> > @@ -1455,6 +1455,8 @@ pd692x0_fw_recv_resp(const struct i2c_client *cli=
ent, unsigned long ms_timeout,
> >
> >       /* Read remaining characters */
> >       ret =3D i2c_master_recv(client, fw_msg_buf + 1, msg_size - 1);
> > +     if (ret < 0)
> > +             return FW_UPLOAD_ERR_RW_ERROR;
> >       if (strncmp(fw_msg_buf, msg_ok, msg_size)) {
>
> The error will be catch anyway by the string comparison. If you want to
> add a check on ret then add another error message.
> This is not a fix.
>
> >               dev_err(&client->dev,
> >                       "Wrong FW download process answer (%*pE)\n",
> > @@ -1465,9 +1467,10 @@ pd692x0_fw_recv_resp(const struct i2c_client *cl=
ient, unsigned long ms_timeout,
> >       return FW_UPLOAD_ERR_NONE;
> >   }
> >
> > -static int pd692x0_fw_write_line(const struct i2c_client *client,
> > -                              const char line[PD692X0_FW_LINE_MAX_SZ],
> > -                              const bool last_line)
> > +static enum fw_upload_err
> > +pd692x0_fw_write_line(const struct i2c_client *client,
> > +                   const char line[PD692X0_FW_LINE_MAX_SZ],
> > +                   const bool last_line)
> >   {
> >       int ret;
> >
> > @@ -1478,19 +1481,12 @@ static int pd692x0_fw_write_line(const struct i=
2c_client *client,
> >               line++;
> >       }
> >
> > -     if (last_line) {
> > -             ret =3D pd692x0_fw_recv_resp(client, 100, "TP\r\n",
> > -                                        sizeof("TP\r\n") - 1);
> > -             if (ret)
> > -                     return ret;
> > -     } else {
> > -             ret =3D pd692x0_fw_recv_resp(client, 100, "T*\r\n",
> > -                                        sizeof("T*\r\n") - 1);
> > -             if (ret)
> > -                     return ret;
> > -     }
> > +     if (last_line)
> > +             return pd692x0_fw_recv_resp(client, 100, "TP\r\n",
> > +                                         sizeof("TP\r\n") - 1);
> >
> > -     return FW_UPLOAD_ERR_NONE;
> > +     return pd692x0_fw_recv_resp(client, 100, "T*\r\n",
> > +                                 sizeof("T*\r\n") - 1);
>
> This is not a fix, just moving code around.
>
> For the rest, FW_UPLOAD_ERR_NONE is similar to ret =3D 0 so there is no
> real issue, only some type mismatch and I am not sure these changes
> should land as a fix.

Sorry for the noisy diff and dense commit message - you are right that
pd692x0_fw_recv_resp() (where fw_msg_buf is zero-initialized) and
pd692x0_fw_write_line() didn't need touching, and all that type churn
buried the actual change.

The only two lines that return a negative errno (-EIO) as an enum
fw_upload_err instead of FW_UPLOAD_ERR_RW_ERROR are:
  1. pd692x0_fw_reset(): 'return ret;' when sending "RST" fails
  2. pd692x0_fw_write(): 'return ret;' when sending 'P' fails (whereas
sending 'E' right above it already returns FW_UPLOAD_ERR_RW_ERROR)

Would you welcome a minimal 2-line patch for net-next (without Fixes:)
just changing those two returns to FW_UPLOAD_ERR_RW_ERROR, or would
you prefer leaving it as-is?

Thanks,
Ian

> Regards
> --
> K=C3=B6ry Maincent, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
>

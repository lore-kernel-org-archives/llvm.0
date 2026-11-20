Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195765;
	b=BzXZ7JC11hfvKoLM2cQKdCPVRmpgXKkID2uVtymAAuLBaZyqx13X1It/fLV9wJMw4ysg
	 +POBJBxMyrVFmHbOOR4amGZgZUF1ZNN+ArLvG9IXbZQ5nAPOR0/zo/uchZRG7idE0wkyf
	 EyYzZ6/7p7OJa2e0Wco8qn0tovvh39VGvaLMI73UgCthT3LSyDx3Hb0MeQxvUwmriakiz
	 MPtQR3yLzVWJA5PKgFuX8R6ekiOYHQ6HMYZnE/YBR9gcvRW2NxR1OElzvG994CnMg539K
	 Cax+hhD0/Gb5gnbhWeiDh04+QAo+MBDJglVogyUcvSXwJQkfSix6nP93zReTxRTB4/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bfTkpAyTY5wLpe1KUDKJKdlMdvgeIJJlYeQhf9YGZ7o=;
	b=DJx9NXrZb9j8JG49Kxpe7YLJ6gD7oanAGL7d+7pCcBthde+1lPpGAjOGgdwIJXsgVc0z
	 m5I2VnLDk9yp0yafbcSllr9zj/EjMB2W0214gFBhpPifz3EBE1zXjWggBVHZrrjDFo4XR
	 8fnRGvzvOlbEJEsnoSP4nCWAN+9x1oI/HYkHLjZUQmxrvRrfoi4EXXQ6KDrQ20hRI+Z6F
	 E6O3dKPsGKGimNtY/LTSes+ElpBQe8vEfjGL8XW7eKy2nYzAoFL3sjkVYCpr5WnFFE21p
	 3cFUWKHj79oK7Z6Piz8cToOyBCxEAxSlPB8ujiV0JRrLh1Vswy01Vjx9V47TKD/ix9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=emMCuXRU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F32606A335
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 17:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18F32606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=emMCuXRU
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533202fe429so372011cf.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 09:29:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795195764; cv=none;
        d=google.com; s=arc-20260327;
        b=ObZoDOkifpyrGzKwe0XxSTF4tgWQxOLMsywVbuccdXsivJSJmYopWxBroL8jGtkCR7
         ITxFPDKzay6vt1GM7lYiI0iut6v3Vvp5whe+YjEPO7H6tt1qeVfOJNJ54M7aee0lbsAS
         EMl59+Wb3XJZdnRUKVvUpeBN5K8SI7gmrg6OEsd4j3v5QPHp0sRHaYZ5v2FJRboXX4BO
         39ak5/bJBsfEeAbqlb/m2t7cF5h/6P0d7vzeOWLI/1Rx5rO3qdnIVN/42U+yrkG4eEh3
         mJ+n3mZAfE2Lmaed8TuBMBvgSBt/QK2MTrpcNLkKQV6wFG2ViV5R81cIdcLqNu9KM0dw
         F/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bfTkpAyTY5wLpe1KUDKJKdlMdvgeIJJlYeQhf9YGZ7o=;
        fh=vvt/wJaKHQE/lzaPo0aTx887m6VmvzytGKZBAIG3IJM=;
        b=mk38N4iXcrg7fVTMnH9VFwgY7GeiDrYruqGEJaej+MIplT+zgfQ+g641XL+GljZVKz
         x7/MuGXVksThJ6J3ZymtPcgnC7nXMcX7ymVH6jPtmKfOpmgCJc05TkiW9GDgS7KPq4nd
         VdudeYJ1yqrXn7tZA1vpnM/JbZzcCZJzIp5+/7xylsM0YEOPkOo0T7nfyeo2g2rJG2Fp
         j309PEJXmheFMSl9/RadD/fj7XOmJZcgeSJ8zaE4v0Pn6N5MA93B7LUtpd5AreD3q4wo
         SkXTLCXuNcAO1NIMdCe7H5AUZtOfqmL8zdW5y1h2xPfgjPi3QDwhWQ/Y3H9Uq7Z7pNKu
         aeWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795195764; x=1795800564; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bfTkpAyTY5wLpe1KUDKJKdlMdvgeIJJlYeQhf9YGZ7o=;
        b=emMCuXRUURaoiXpKWIOSl6aUa3YtA0NvG2Eu6tzk/axtM5N4WExKQkm/v7q33JJzYT
         if66wA51YrhRUV1Tss9QYBl68L/rRZlakASVGtI9CdzXzHW48/Ix8wlgpjrOPSzqTUMm
         g29lnWcWxIE8JZ6JFYIziLHavH68q/CKoalhG9JXbc9AM8QJ9WSUsyJNBCJhzgmSeBV9
         POBSi8mom77lTQ3DQyGgCTfJrRBsNK9AtvL/ErafDVsy8UungU4/5KVRd68PZpBz2hpe
         gw7mKqAZylJwIyqBnwlKN25gFCrqnqkDR0EQE+slvZhhJPnb4Bzaq36/cwTXS7AcUUvl
         rdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195764; x=1795800564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfTkpAyTY5wLpe1KUDKJKdlMdvgeIJJlYeQhf9YGZ7o=;
        b=umpWQWAnECOdvV2fZ2RWfXIW+H0CMRB4uKAvLCIbdeJuOyaRKCkAsLrRPoa83zCWYk
         wTeimg9ecFDE4bw9jIM+Hun5v9akvuAd8aGn4tlOBD+Ov7ZSj0JRd1B/SMp1lr/dlhW2
         TSg08OGsYsTgwl9T5qOGkLnI+4+g3SJ5rqERxshWRIqhEWKXD7H6ZbcMrIjXWxQ3pcOk
         TgdWkhbM7T9ckuhGymz7Om5YoW1hUUOxZFKja3oATFfoQ7gT6uglhiLP9fzln85qmzST
         iyQppvyovuP/uDBnoefw0RYZlIe3DldV0ZOG2DeZXKeIWgWiODZFKS1Avf6TPk3bmaIz
         TtXA==
X-Forwarded-Encrypted: i=1; AL+hErFnzF5+JXCJxqPAhS6JF6rdKiYtQbPOkr/7GMARojOafpA8M9+m2PtTgehAf+TFjK6ZkgZe@lists.linux.dev
X-Gm-Message-State: APuU4Z9mtzs8zAEvE0HCS35/1R3oqB9R1bYjJOj9N1PDECLRTQVEiwX+
	biCIA7AVI3+sfh5WijSeT4PdiUDDIPTReaOLaF3q/eRfg/q6dz/rrXmXJFpkfBe5Rmkt7EwB+TL
	HgCd2LBWi8674lhUMzbFL4TD5ofOQblMah9F3XQDk
X-Gm-Gg: AYBFou2wXZ/tw7aMzvggmnDLGlM/VqmNFLZNnhg/oqZnMk3QP1ZUjFyNf1xPoLb4TxB
	gcEenKVDIv5/pTjwwQB3dZy6lAxp4bQUbURvtA433gRe/wBN9NWI6COhGCh+UgZi2X0AlisewHv
	bdPCGqcEOSuSgaBFzkAIlSkolBN++qScBdkiePK1FoVJBqnpZjY2UmYXtbqbRJzb/jd6qyNKvr0
	IwHP/WAOIWQGjtVO0m+zfucKIlMLcu/FzBzsssCadYEgmrPXdblvxAKKolNv8b8Zwslih2u6OkO
	oZA+Ax4ztwKMbJNAaWPop0h172PXme9RSiy7Ay3ARInMxeT0IIVme9+CiQChsdIBmc8kGm5maXL
	XFsL3luZ1KgpYuR+qYymP4Mbfbbou78Tgyn3Z
X-Received: by 2002:a05:622a:2b07:b0:536:6ea4:e6a0 with SMTP id
 d75a77b69052e-55d7a35af5emr20936351cf.11.1795195763344; Fri, 20 Nov 2026
 09:29:23 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119170853.1529676-1-irogers@google.com> <awBiQ0S1hYnm-ngo@black.igk.intel.com>
In-Reply-To: <awBiQ0S1hYnm-ngo@black.igk.intel.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:29:11 -0800
X-Gm-Features: Aa3M54qjIXZFwfoIO-dZiEsJTXyVaZW2PPM6ShZu-HH-RmWEeaNIOyio_jR0G5c
Message-ID: <CAP-5=fVhPeWOCmQRB3ZAkv9jS4cOgsHr_yekiLon9ZhF6Mmsdw@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: Avoid reading uninitialized
 state on error paths
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 7:08=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Thu, Nov 19, 2026 at 09:08:53AM -0800, Ian Rogers wrote:
> > In qcom_pmic_typec_port_set_cc(), error paths from regmap_read() and th=
e
> > default switch branch jump to 'done:', which logs 'currsrc', 'mode', an=
d
> > 'misc' via dev_dbg() and passes uninitialized 'currsrc' into
> > rp_sel_to_name(), indexing rp_sel_name[] out-of-bounds when dynamic deb=
ug
> > is enabled. Similarly, early error paths in qcom_pmic_typec_port_get_cc=
()
> > jump to 'done:' before 'misc', 'attached', '*cc1', and '*cc2' are
> > initialized.
> >
> > Return early on error paths in both functions instead of jumping to the
> > post-success dev_dbg() trace.
> >
> > Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> > -Wconditional-uninitialized enabled; fix and changelog drafted with an =
AI
> > coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
> > -Wconditional-uninitialized; not tested on Qualcomm PMIC Type-C hardwar=
e.
> >
> > Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver=
")
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> No stable here either?

Agreed, 'Cc: stable@vger.kernel.org' makes sense here too (especially
for the rp_sel_name[] out-of-bounds read under dynamic debug). I'm
happy to send a v2 adding Cc: stable@vger.kernel.org, unless you
prefer to add it when applying.

Thanks,
Ian

> Thanks,
>
> > ---
> >  .../typec/tcpm/qcom/qcom_pmic_typec_port.c    | 25 +++++++++----------
> >  1 file changed, 12 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drive=
rs/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > index b2ad31e85b5e..a1595b8b53e7 100644
> > --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > @@ -372,14 +372,12 @@ static int qcom_pmic_typec_port_get_cc(struct tcp=
c_dev *tcpc,
> >       ret =3D regmap_read(pmic_typec_port->regmap,
> >                         pmic_typec_port->base + TYPEC_MISC_STATUS_REG, =
&misc);
> >       if (ret)
> > -             goto done;
> > +             return ret;
> >
> >       attached =3D !!(misc & CC_ATTACHED);
> >
> > -     if (pmic_typec_port->debouncing_cc) {
> > -             ret =3D -EBUSY;
> > -             goto done;
> > -     }
> > +     if (pmic_typec_port->debouncing_cc)
> > +             return -EBUSY;
> >
> >       *cc1 =3D TYPEC_CC_OPEN;
> >       *cc2 =3D TYPEC_CC_OPEN;
> > @@ -392,7 +390,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_=
dev *tcpc,
> >                                 pmic_typec_port->base + TYPEC_SRC_STATU=
S_REG,
> >                                 &val);
> >               if (ret)
> > -                     goto done;
> > +                     return ret;
> >               switch (val & DETECTED_SRC_TYPE_MASK) {
> >               case AUDIO_ACCESS_RA_RA:
> >                       val =3D TYPEC_CC_RA;
> > @@ -417,7 +415,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_=
dev *tcpc,
> >                                 pmic_typec_port->base + TYPEC_SNK_STATU=
S_REG,
> >                                 &val);
> >               if (ret)
> > -                     goto done;
> > +                     return ret;
> >               switch (val & DETECTED_SNK_TYPE_MASK) {
> >               case SNK_RP_STD:
> >                       val =3D TYPEC_CC_RP_DEF;
> > @@ -472,7 +470,7 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_=
dev *tcpc,
> >                         pmic_typec_port->base + TYPEC_MISC_STATUS_REG,
> >                         &misc);
> >       if (ret)
> > -             goto done;
> > +             goto err_unlock;
> >
> >       mode =3D EN_SRC_ONLY;
> >
> > @@ -496,7 +494,7 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_=
dev *tcpc,
> >       default:
> >               dev_warn(dev, "unexpected set_cc %d\n", cc);
> >               ret =3D -EINVAL;
> > -             goto done;
> > +             goto err_unlock;
> >       }
> >
> >       if (mode =3D=3D EN_SRC_ONLY) {
> > @@ -504,14 +502,11 @@ static int qcom_pmic_typec_port_set_cc(struct tcp=
c_dev *tcpc,
> >                                  pmic_typec_port->base + TYPEC_CURRSRC_=
CFG_REG,
> >                                  currsrc);
> >               if (ret)
> > -                     goto done;
> > +                     goto err_unlock;
> >       }
> >
> >       pmic_typec_port->cc =3D cc;
> >       qcom_pmic_set_cc_debounce(pmic_typec_port);
> > -     ret =3D 0;
> > -
> > -done:
> >       spin_unlock_irqrestore(&pmic_typec_port->lock, flags);
> >
> >       dev_dbg(dev, "set_cc: currsrc=3D%x %s mode %s debounce %d attache=
d %d cc=3D%s\n",
> > @@ -520,6 +515,10 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc=
_dev *tcpc,
> >               pmic_typec_port->debouncing_cc, !!(misc & CC_ATTACHED),
> >               misc_to_cc(misc));
> >
> > +     return 0;
> > +
> > +err_unlock:
> > +     spin_unlock_irqrestore(&pmic_typec_port->lock, flags);
> >       return ret;
> >  }
> >
> > --
> > 2.56.1.708.g77570a6a1d-goog
>
> --
> heikki

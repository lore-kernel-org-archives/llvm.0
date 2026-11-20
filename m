Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195668;
	b=Ys3ozFKfuhzfgxR2VBZYNZTxrVOPWjAYXnmzJtIMv+N+0e/P5AdP8/g6txtlYfl7Lqnk
	 kc7/K6jCnWVh/pZimdCHvJ1ZtH7uR6BdWqf/g2vTg5OnV67m7huciBN1CR6gwzThNCyN8
	 Hp615qqPguuSyFTbQEeSR2JSSWR1Ipl9/MZE9Nmtms1OaZsv9fPYt3B4V2JPtUEanUEbs
	 ufj+iXQoTlhXl87Pm0WKYZAKD4/vwOW4vM3Keo2ElnN0tuo85fvnlj/KL8cR7G+0pMXZB
	 CUh1rGKdOl1AAjTfjAB9TX795/ga1113Lo4vKGEqwNocztpjIyjFnOfBaFgy2145fEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=piUlh1pDCE0su43+DcLPJxvz8UQFYkDV7njOU8o8Pjw=;
	b=4s56cv5k/co4I2erctIIvpsmEFBUbeHa3ifmoZnc2stvqPf2nSbFaKuctj/hXXuRmGJH
	 cUYqZIDS6jwze3aRknezPKmlhFFzcBWcuZLRUErlfGrARfTpy7rd5n/avm5NSqhQE05L+
	 H/GF0pNMHC2qAlnB+Ue0Av6JjwgHM0PLez0onJ0nFD/RudkSqtZE9TCjxDX1W0Yt49Wr8
	 DUPpGZyMHDzyuFRbRn53HldocFfYdqPwMq8znvaWUk66fs5YnW7d9zOrrYzra6fqQl2jd
	 hNmkzWDRp8fc4siWKpeNh/D8pUPLd3AxzXnE1Ywwp8rgt9NL+ngWnTYqhmMkl0rnxhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kff5p49u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC65A606A330
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 17:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC65A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kff5p49u
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-55be673e029so305031cf.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 09:27:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795195667; cv=none;
        d=google.com; s=arc-20260327;
        b=iHodosUzr5oOHLrCGv3JWmPlWn7fpKxAnrxsKbsY3pNk42cm+2K55CZ6xiC+qjEq5i
         AsyM4gsMHafmZHxiz6pao1KMwCxzMgWpIO3wUj3arofNo3jHxsnj4b+GfTi/pk0e/zSR
         GsV231/SMCaltqYNUo00Ne6BNLJFoM2OqhRJnqFr+58cg+3aFr/oNlzleWzZR9BCLcir
         uVZRR0fV1cwx0umtEqXyNJpPL6KWiZllsu4yAUzhc4SD5By/m15AVGYvxDTjtKKnkubz
         SUGdITurvBOkzWtoSXwnbAuWq1zw2KOSn4V2/FL03+waZKOM5A0BtpBsbG9cldlmfolV
         PMrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=piUlh1pDCE0su43+DcLPJxvz8UQFYkDV7njOU8o8Pjw=;
        fh=ALdbACpswly7x0NTdW+NTszsufd4tEn+Yd8avzMkrZo=;
        b=GBkMJP608iUSswLuXF1uVdVUpZq3bkrpkFvhtCc7L6oMhm71B+mjTjZ1qby+28QDqs
         Lr+/qFHBZF9L//7yZP4wcFbAluAKKd1vyYsOdDtpkLuh1eN+Jsi6GXnGdV7VgqZNA1Rz
         e9q5c3Ub/FZ++qqdxcinmVR70RofWL6Ul3zEDHmTWllut65Qd7Xri27g2mKWr0V34jQ5
         jOhvvjP9cbeJSEV+hHFKnDrdep8o4o53Naf9AQnlNNU3UCB2N9eFtkxTAZNhTmVhWPwK
         D7VMoiJeL2SsVDpUt/07dBvpPSI+lT3wfgwKKmwQ18ktPcw+r6ra6PUEqcISLOYQTHRa
         9xAA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795195667; x=1795800467; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=piUlh1pDCE0su43+DcLPJxvz8UQFYkDV7njOU8o8Pjw=;
        b=kff5p49urKtOKN3GM0H607Xcu7rN0j9wU86beWqxOnaaeWU4YgMSX9BOg+5m/O3GYS
         ZlLtTRm5CBKXJe5CnhEodRgd7f0bX3oPavR6udIGNEVvafA22WEEpNXDSjhdrQrS6KnK
         iD29KQssOSUYGtkqkPVXhWShoBtQFtntAXJ3ZpyotOr8Mu46kVPpIPj+6AQoBoZbKWd/
         9GqshLHKCEclZKl06sxFopc5HsArNQxcO0lT19yh28WKtUMsgMO9o7V27s2L4o2emIp1
         9ARxjRU8Aynf44H8ZSrzyexWR+qJBFDPjs4TqhNi+SuXekW7UMn6hJwkX9BLj5y1y2f9
         Bclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195667; x=1795800467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piUlh1pDCE0su43+DcLPJxvz8UQFYkDV7njOU8o8Pjw=;
        b=Z8mybzGOAkTuXKVcfyCDt5fnQuK0J+6OWWO9oHpqEMmxX+tUvqBBczAePX41PCwjjw
         Qv2JZOB7IkZUP2YEmx1PeZ9mYwNP9An1ZMBghV30z0ckQU7S4QmT+f5hzszZt8LlSkn7
         Y4DtbhdWovkBD9TOXJVHOFYYve8st1WfSKfMw2/J/nuRKleLtHYN6VEuumnjqNxi4tw9
         cCfSThRaxsQUNb3Hv9ZGyUvTFIcOm9UskL5sLboBuEqZ8rna5qBt2nanb14R1z/bQMKJ
         vTQMGqGON1f42gf3XgWMqwsyUwMnLpmPyMEvCexd1i/BzjVhv76eO3CTGH0U6EI5UGYu
         QEdA==
X-Forwarded-Encrypted: i=1; AL+hErHRWXXRYHK3lYKjIpFzyylbVeELQ/bGsWoc+QuxhGMsxiZBouC0zi1kCIq6ND3dxaPMtbRR@lists.linux.dev
X-Gm-Message-State: APuU4Z+OurNH7NU2IAiInWQ/+mtZvXpn9KOx5TECqc1gNsyuNIzz48gc
	zEXOEtAN59s/088QMbQP4PHzwxn/9QoYOgQVMurnsVsdK3CifZohGd7uOXMV3iXmjLFQuD/zdED
	2Zj35jy0hwGFUjJ9bOa+E0s1pafRAYqnpiOl6mLeZ
X-Gm-Gg: AYBFou1oLzfyD5+EceGUzKuR6YdW6K0Qt1sT3CETXoXiUq472sAAbgNIs9t1HphNHg6
	e0rmNdAyG2NX/EMKG55yw3yqf2SE48rSd0tsEN7Yhl4aHBFoD2YDulSaDHcxDrc/8R5CbUmaHOO
	vN6QG9d71TuiQ6qjZTKJqvXCi2MLs8ajoe8SGbj45amj3IG7J2U+Xd1EF8gPI5FyYd3kGoKGxpr
	55Jx2cnvyf8Bfk1sE8kFU42MRiZvuHI4IpDf8QV9q0OGAlA3EU5of28vlhSeWhUIJFd+4F75Inf
	PaTczBiB7lWMedtICuLZjjDW1PgYdCYl5xkDru4zzXzGHX1Ox7VgJgD48rR8o1efDEYXRWeUDgM
	X18Hpuzs6pkGk2bMXForzbY/FWY0ivT8x00gT
X-Received: by 2002:a05:622a:c15:b0:534:d386:c3f1 with SMTP id
 d75a77b69052e-55d7a315ba4mr21064171cf.9.1795195666028; Fri, 20 Nov 2026
 09:27:46 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119170650.1521609-1-irogers@google.com> <2026112003-dreamlike-tricolor-f055@gregkh>
In-Reply-To: <2026112003-dreamlike-tricolor-f055@gregkh>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:27:34 -0800
X-Gm-Features: Aa3M54qV1ST3KDVbaaaVUVHrHiimI6d3jD3qxAM9oI-AuQL6wZNiVzw5o3Go7mg
Message-ID: <CAP-5=fWg=m_O4tbCFWZ_-_tvmxPcQqOxr3V2-Sz1T07CbAss5Q@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: hd3ss3220: Propagate regmap_read() errors
 from attached-state check
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 8:05=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Nov 19, 2026 at 09:06:49AM -0800, Ian Rogers wrote:
> > hd3ss3220_get_attached_state() has return type 'enum usb_role' (an
> > unsigned enum) yet returns negative regmap_read() error codes directly.
> > Neither hd3ss3220_set_role() nor output_poll_execute() checks for error=
s;
> > on a transient I2C failure (such as -EIO, cast to 0xfffffffb),
> > hd3ss3220_set_role() passes the bogus value to usb_role_switch_set_role=
()
> > and disables VBUS power. On role-switch providers without a .get callba=
ck
> > (where sw->role caches the value passed to usb_role_switch_set_role()),
> > reading /sys/class/usb_role/*/role subsequently indexes usb_roles[role]
> > out-of-bounds.
> >
> > Return an int status from hd3ss3220_get_attached_state(), pass the
> > resolved enum usb_role via an output pointer, and leave the current rol=
e
> > and VBUS state unchanged on I2C read errors.
> >
> > Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> > -Wimplicit-int-enum-cast enabled; fix and changelog drafted with an AI
> > coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
> > -Wimplicit-int-enum-cast; not tested on TI HD3SS3220 hardware.
> >
> > Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DR=
P port controller")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  drivers/usb/typec/hd3ss3220.c | 22 +++++++++++++---------
> >  1 file changed, 13 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss322=
0.c
> > index 60d6de9ba339..212c3624961c 100644
> > --- a/drivers/usb/typec/hd3ss3220.c
> > +++ b/drivers/usb/typec/hd3ss3220.c
> > @@ -163,10 +163,10 @@ static int hd3ss3220_set_source_pref(struct hd3ss=
3220 *hd3ss3220, int prefer_rol
> >                                 src_pref);
> >  }
> >
> > -static enum usb_role hd3ss3220_get_attached_state(struct hd3ss3220 *hd=
3ss3220)
> > +static int hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220,
> > +                                     enum usb_role *attached_state)
> >  {
> >       unsigned int reg_val;
> > -     enum usb_role attached_state;
> >       int ret;
> >
> >       ret =3D regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL=
,
> > @@ -176,17 +176,17 @@ static enum usb_role hd3ss3220_get_attached_state=
(struct hd3ss3220 *hd3ss3220)
> >
> >       switch (reg_val & HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK)=
 {
> >       case HD3SS3220_REG_CN_STAT_CTRL_AS_DFP:
> > -             attached_state =3D USB_ROLE_HOST;
> > +             *attached_state =3D USB_ROLE_HOST;
> >               break;
> >       case HD3SS3220_REG_CN_STAT_CTRL_AS_UFP:
> > -             attached_state =3D USB_ROLE_DEVICE;
> > +             *attached_state =3D USB_ROLE_DEVICE;
> >               break;
> >       default:
> > -             attached_state =3D USB_ROLE_NONE;
> > +             *attached_state =3D USB_ROLE_NONE;
> >               break;
> >       }
> >
> > -     return attached_state;
> > +     return 0;
> >  }
> >
> >  static int hd3ss3220_try_role(struct typec_port *port, int role)
> > @@ -231,7 +231,10 @@ static void hd3ss3220_regulator_control(struct hd3=
ss3220 *hd3ss3220, bool on)
> >
> >  static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
> >  {
> > -     enum usb_role role_state =3D hd3ss3220_get_attached_state(hd3ss32=
20);
> > +     enum usb_role role_state;
> > +
> > +     if (hd3ss3220_get_attached_state(hd3ss3220, &role_state) < 0)
> > +             return;
>
> No error propagation backward?

 Good point - hd3ss3220_probe() can fail probe and hd3ss3220_irq() can
return IRQ_NONE without clearing INT_STATUS if hd3ss3220_set_role()
returns an int error (the third caller, output_poll_execute(), is a
void delayed_work callback). I'll propagate the error out of
hd3ss3220_set_role() in v2.

> >
> >       usb_role_switch_set_role(hd3ss3220->role_sw, role_state);
> >
> > @@ -258,9 +261,10 @@ static void output_poll_execute(struct work_struct=
 *work)
> >       struct hd3ss3220 *hd3ss3220 =3D container_of(delayed_work,
> >                                                  struct hd3ss3220,
> >                                                  output_poll_work);
> > -     enum usb_role role_state =3D hd3ss3220_get_attached_state(hd3ss32=
20);
> > +     enum usb_role role_state;
> >
> > -     if (hd3ss3220->role_state !=3D role_state)
> > +     if (hd3ss3220_get_attached_state(hd3ss3220, &role_state) =3D=3D 0=
 &&
>
> Why test for 0?

I'll change this to '!hd3ss3220_get_attached_state(...)' in v2 (and
add Cc: stable@vger.kernel.org per Heikki's note).

Thanks,
Ian

> thanks,
>
> greg k-h

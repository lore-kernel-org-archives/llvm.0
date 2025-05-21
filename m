Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56EC23A9AE
	for <llvm@lists.linux.dev>; Wed, 21 May 2025 22:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747866402; cv=none; b=hpq3IGa1stvkKONHlVPEzcCw/vjAIkv44kWJ59t0rZzA42Qeclmo/MhwbSQYK6zq61pG8CZM6ZRCaTMSOwLXwSwM5jTwoDuyIGfaakMcobzuhn4rj+TJK6X99B6FbmUiSP/RFq3pMwkQLuVCepxRBEqDl6aXtzekURV9m02ItjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747866402; c=relaxed/simple;
	bh=9Wg6PPoLM9WFD1B0FiNbRv3qnbGj9YtPrQiT2xmvAlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mc8kTUjmwqx5ucwQxUHxMTVqnQFpO+aanH4GUOeiPCebfb4QgHXpc3lbmkQYeF/cmXny27Pqxy/NI/HBWFmtxTlIFSVdarMsygbSa3RC/aK8c+WS5zmtOyfx7RO1C5TgHdxzu7t67/0xUkltxl6w9LAtUApCk3RRIsF0tyyjWiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=bsdhS5kK; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="bsdhS5kK"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70b50e0566fso69752807b3.0
        for <llvm@lists.linux.dev>; Wed, 21 May 2025 15:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747866399; x=1748471199; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2CpApAzFU/xdWj9L8OzabAbfmuyqqCQstsc9xr7aRs=;
        b=bsdhS5kKqV3sNuWNxZedH1EFkPtfFMsvC36kcFq35KqQw4E4OBuZf5/bLkJzG4yrk7
         eBnWKAp6F9ysX3q+NKaxStHrc/Z6HGVO+uks94RAAxnRkQeG4LX1zoYWzFtk+ymuSVh/
         QZd+eN87CaQN+6Noj+4F0KZ2HAW4boT/afgDuMo7myUKaTumsGQt3sCM2lN1PJ88dBR4
         7S8M4cyXvvnp7YPdFn+Q6Z+GXgdiMjFvt2MCKFscbWYLIA1fXPx834tpnXUvY9OzxxQi
         Pos0YnAtu4O3fipD8anIlioYsHrtY2k0UuwFi3NwqySaUGLXi0VDJz60ZG9W4kp7nqU8
         86Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747866399; x=1748471199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2CpApAzFU/xdWj9L8OzabAbfmuyqqCQstsc9xr7aRs=;
        b=E50G/tQ238iGLpCy8115sU9Kw4/8i5ZSa1EWuSKqjfL2uaFeIvoEhGN5Kj1QNN+DjE
         j/bo5y6LzHm6GuH/wiOwGxsT8p8i6A+uRCCLwNc2j+yZBsd+1Q18OfCI8kBmQAsxVRn/
         R7ui1e9dz1KDEtQ+o143cCnmmgtaU7F4kcx7AtURiLNYsxLqRfSQNRkSjmHhyuBHh+mR
         kr34Qoj7b2Y+a1K8JYGvpY8dhZGa9tbVqDEAbJK4P6qGt8UuQWhQt/5h7HMnJib8C7kI
         BSpvEkdm/Lr5gpqAAoBcRifMdJfQaYzjIAORwr0H0MPjsAdlNiDtwP77Ndvskv0DZVEl
         Ifug==
X-Forwarded-Encrypted: i=1; AJvYcCVckU3zgcJILfVYZSiQNZdsxLib4FHx5nqlwad1YUDpoDCdHM2Itn5scu2NjOY+DKJM58y5@lists.linux.dev
X-Gm-Message-State: AOJu0YynHIlFDfvVXMwjdXy7G0fFJj3Y39n8y+MkTYV8PuS4OVn49dS7
	PS5b3DpOmIMFIE/2IcksiymchxqX64rFBePmx0AC8nOayFmN6r7S7ZvDXe8dRtQqjD1jVsoN0Oa
	aj6A28YIQshbm72RfYKKOXkCjT5sGAgiUZXfJMTtK
X-Gm-Gg: ASbGnctmTMwEj3NQ0ht2UhJqymOGJmEnYCPdPHMn/L6Qt0JD6aTCl/Kj+iMC/fVzID3
	KHbLMacSYI4AAtFjckzv+442alJVQzYKDf5xKyr/mC3yht4gnEfU3ImyroMcFnA0d51NuIRoZPW
	JrYqXlTeLE58dlBeJDEOYVDDtKAh26BSnF
X-Google-Smtp-Source: AGHT+IHWrEn3lGbj54WMbP1QWqKgIGqbS12jw/F6NygMZdWDXAhufhQc4tMWD/kGAI3Getozp0LttKjpfQRDZM9iHFA=
X-Received: by 2002:a05:690c:4883:b0:70d:f35d:4d26 with SMTP id
 00721157ae682-70df35d4d9fmr60596797b3.21.1747866399572; Wed, 21 May 2025
 15:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250502184421.1424368-1-bboscaccy@linux.microsoft.com>
 <20250502210034.284051-1-kpsingh@kernel.org> <CAHC9VhS5Vevcq90OxTmAp2=XtR1qOiDDe5sSXReX5oXzf+siVQ@mail.gmail.com>
 <CACYkzJ5jsWFiXMRDwoGib5t+Xje6STTuJGRZM9Vg2dFz7uPa-g@mail.gmail.com>
 <CACYkzJ6VQUExfyt0=-FmXz46GHJh3d=FXh5j4KfexcEFbHV-vg@mail.gmail.com>
 <CAHC9VhQL_FkUH8F1fvFZmC-8UwZh3zkwjomCo1PiWNW0EGYUPw@mail.gmail.com>
 <CACYkzJ4+=3owK+ELD9Nw7Rrm-UajxXEw8kVtOTJJ+SNAXpsOpw@mail.gmail.com>
 <CAHC9VhTeFBhdagvw4cT3EvA72EYCfAn6ToptpE9PWipG9YLrFw@mail.gmail.com>
 <CAADnVQJ4GDKvLSWuAMdwajA0V2DEw5m-O228QknW8Eo9jxhyig@mail.gmail.com>
 <CAHC9VhTJcV1mqBpxVUtpLhrN4Y9W_BGgB_La5QCqObGheK28Ug@mail.gmail.com>
 <CAADnVQ+wE5cGhy6tgmWgUwkNutueEsrhh6UR8N2fzrZjt-vb4g@mail.gmail.com>
 <196e1f03128.28a7.85c95baa4474aabc7814e68940a78392@paul-moore.com>
 <CAADnVQ+=2PnYHui2L0g0brNc+NqV8MtaRaU-XXpoXfJoghXpww@mail.gmail.com>
 <CAHC9VhRKZdEia0XUMs2+hRVC7oDzkBfkk5FPMD+Fq5V7mAk=Vg@mail.gmail.com>
 <CACYkzJ7oxFA3u9eKDpKgCsZsYsBojVJPHVeHZnVaYQ5e9DavmQ@mail.gmail.com> <CAHC9VhQ7Rr1jJm=HY2ixUWpsRuwCxjOq5OTMfn5k5hRzxTCz-Q@mail.gmail.com>
In-Reply-To: <CAHC9VhQ7Rr1jJm=HY2ixUWpsRuwCxjOq5OTMfn5k5hRzxTCz-Q@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 21 May 2025 18:26:27 -0400
X-Gm-Features: AX0GCFvZaSST-PWkU4_ibBxMlaa0A91pXSzh3ZzCdqeIU3YX4GLRRjzs5eOILBs
Message-ID: <CAHC9VhTj3=ZXgrYMNA+G64zsOyZO+78uDs1g=kh91=GR5KypYg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Introducing Hornet LSM
To: KP Singh <kpsingh@kernel.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	Blaise Boscaccy <bboscaccy@linux.microsoft.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, bpf <bpf@vger.kernel.org>, 
	code@tyhicks.com, Jonathan Corbet <corbet@lwn.net>, "David S. Miller" <davem@davemloft.net>, 
	David Howells <dhowells@redhat.com>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Jarkko Sakkinen <jarkko@kernel.org>, 
	James Morris <jmorris@namei.org>, Jan Stancek <jstancek@redhat.com>, 
	Justin Stitt <justinstitt@google.com>, keyrings@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	LSM List <linux-security-module@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas@fjasle.eu>, nkapron@google.com, 
	Roberto Sassu <roberto.sassu@huawei.com>, "Serge E . Hallyn" <serge@hallyn.com>, 
	Shuah Khan <shuah@kernel.org>, Matteo Croce <teknoraver@meta.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>, kysrinivasan@gmail.com, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 6:58=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> When the kernel performs a security relevant operation, such as
> verifying the signature on a BPF program, where the result of the
> operation serves as input to a policy decision, system measurement,
> audit event, etc. the LSM hook needs to be located after the security
> relevant operation takes place so that the hook is able to properly
> take into account the state of the event/system and record the actual
> result as opposed to an implied result (this is critical for auditing,
> measurement, attestation, etc.).
>
> You explained why you believe the field/hook is not required, but I'm
> asking for your *technical*objections*.  I understand that you believe
> these changes are not required, but as described above, I happen to
> disagree and therefore it would be helpful to understand the technical
> reasons why you can't accept the field/hook changes.  Is there a
> technical reason which would prevent such changes, or is it simply a
> rejection of the use case and requirements above?

Bubbling this back up to the top of your inbox ...

--=20
paul-moore.com

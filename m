Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA0F3FAE0B
	for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 12:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777467128; cv=pass; b=L8/X3hG1Q3uynv0B9FgJgBvKdMR+3/d6S0UdzbbzE22F/Qbj3w2ZyNWb6W8nz+9kDG20kk+yB3FcfvcWHE58zn3OIXgae0MLpc9tm7yQsWNWdG9xxHmexGhfYv/IocY/e9Sgrr5+pxE0ZBoDv0KYfhLt2h/uwttYGZe5kiY3CDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777467128; c=relaxed/simple;
	bh=E2TZSITLTsrNHHdKbUhVgqhN1rXI3sRd8ys1HWWOTps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SsIeQZ54KadoXUzgnvphyb6tiyrjAbKAYHT65iMRyBZt1G2oFRVW/PmziWJD6S3YQ0+NVlyEQowwkeRF30rJnRg1D8DonhsjnsKvitJMdGgGsPpSwcRIgPBKIGYysqihzg3xbwQdtzdY0xxFJITaneI7q2r3GUXNBSdCKNJEWEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEqnq8i/; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEqnq8i/"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b8095668ebso890546eec.2
        for <llvm@lists.linux.dev>; Wed, 29 Apr 2026 05:52:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777467125; cv=none;
        d=google.com; s=arc-20240605;
        b=BH05tchlIh3HT0GG1dIeqDfBFTIGrBImaYqhxvnXnj7oaZBhXlC+PsM8fwylSUsJ02
         oztcaEdaMafQaXYm/0kv0DVR+TIpVIcOXyuBswqWeOV8Knn5sjn2YzebkS+YP4M3LOC+
         aF45X1bROekMSp1K9GNiyPifkZyCbUpwAgnoMu6ubNYgBSXzWC2OHTecy/f19anfAGIY
         MFlLKMlYN26VqOxUbD2s56mWeg19kkZZGTvge18dzh9j4tFTSR729ye02LKeGbmHBzCp
         njqYPPXhwBNmMsEId9lTIRrYOwroMp9WPo2XjfeslxqOyWkaN9bJ8jGbkGKOpKnSYrrN
         NmdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E2TZSITLTsrNHHdKbUhVgqhN1rXI3sRd8ys1HWWOTps=;
        fh=UlHgfmMLy0UhKohrPUP3wG6JrqeElIUZMv9EjpkioYs=;
        b=b2vLgM1JVR83kREeEANpYR6W5QUtJqGaDhK5X6YgaBjJ/fuAvay8BTIzXSZOONPgW4
         cZhCSRx+wuwNazNuOKXWwzkeE2TtSGsmSRTQbBpBQis8ly9liAECSmpYeUh9zmCaq+5q
         jPaBHf0rq6RmwdAvabwOewHxybVXFO3u0ZnVGtfgI8HvSjwdSTaR3wT5YoG0jBrseEDi
         qPGPmUu49ARxj6KYQTLTvyU34P0NlO+8H9lV2SBGXSBVKlBLsnm2v/Tc6mSzENMUI5EJ
         Zyc4wyuaFASjBK00nIvHzKbNZ3Sp2VuMERnnIP06CxgvkHgAVj6HXtAOC6SdoYlE9LSH
         T5dA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777467125; x=1778071925; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2TZSITLTsrNHHdKbUhVgqhN1rXI3sRd8ys1HWWOTps=;
        b=SEqnq8i/ALttYBlIT/CWC/K8kturp2O+yXPxEtEEmfp3jGQ2DcJAQWXbSliNa6Zsm5
         Wqzvdo+r0MRXCZTYrQsMwAD8J0xF8wzMYY8Y3gJb6TsLeXcMpubk2svFmtIDQXgR5ZZk
         hjmN+vh+0u5iHlQJfNOPnZN6fr3tSelacnIofFItuDswI8ck5Sv4TX8r6Dx70n/RWe/P
         MbjWQ9oxeDxqcvHg3y5xtitc6P+nh/X8nySccBxwqFsAviGDO+lnVvD5fmevmA511ao0
         lahHSiXo1dtpIgajkDQVlJ7lu5SbMZBok2T2Q6MHsKqmGVmuwwzCJdB18ecUHYY4vAi/
         Pazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777467125; x=1778071925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E2TZSITLTsrNHHdKbUhVgqhN1rXI3sRd8ys1HWWOTps=;
        b=TdH1m5aVqCiq2bAnqtjDApj0HtBHIbd2hOkwEpwVWVojL90grgAW5/soIXjj5WdRWt
         KV52z/bs55Ga2KP90mHt29ymt7BFlZyHhztysgSnBbw7yDIgXQMq04cdbiuKifZyRA/g
         6Hg7Oyl/sT09rccstfTxhR7LzSopKsOuzBq7lWPONNQ/+9V4rDAJDz/13ye8y63RgorG
         rrrO3/h6WKWfS3287XlqU91m097Q2sNkMNdwziAaBnhRfvKjrFbyTOD7mt4GSjage/gR
         M29f8VOJS802bSERK2GdCHsl8OBL1keUL+IMA1oik/6JMMA70UJl2RZFm2GWIqMh5oz7
         EZ0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/6NGg1waggmbZHy/PBZGXKyVon8ifcG5Xvbfwp10amD6Zs5bQl9jl8ZqrVX19n5g3EDa+M@lists.linux.dev
X-Gm-Message-State: AOJu0YwBaHiPK+Dosu72bD0EmZTSgmh+roDyN61keA7Bh+BmaKCHGiKT
	ZXV5BVKEZ7rUWGNkIxMmgJylfwO8kJ5yHlIJhQ2cdZC24MiWyTjIFaTXT0Koic/pmqX+0T2/MHh
	dOBOvMw5fZqxR4pBfXBKdYPoOSqOE89I=
X-Gm-Gg: AeBDietDvXDabo9zav/9EUoRsrjNti6RjUN3eZou5wF9XrtiY3uiV7mKn32PdNVgKer
	FNY/pG6rVnZ0nXrjpHHQg49LQIsQo9BUN+2V3GNYZxvZMhNx2+6+gJPSvsXPMokn8tsgBAQraJ9
	xVGG+akv+FUkFLzzg7muIa7tsykseuKw/gza34aTbt5f5YbwTu11qYyGpbtITx/j7Q5hiWQZzy4
	llrNSSXMc0Vspww3UM9i81bpdxdbTqax6IEZF67tU44AF6aiT0EKsOfacY8mOzhXLL0AHz8hdJq
	LEBde88kBiU6Q+onxRKc4jOO8KrdyliQmjbvurye7hggZ5QppUUODWI0mJzrud0pBu6cw7WOdwD
	HYKpj79gSr1i3t1Ywk4Z355zVTlrcRK1mOvc/edvftWQb
X-Received: by 2002:a05:7301:fa0a:b0:2de:6c38:707a with SMTP id
 5a478bee46e88-2ed09bac677mr1577805eec.3.1777467125286; Wed, 29 Apr 2026
 05:52:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260426105932.2270364-1-mkchauras@gmail.com> <20260426105932.2270364-7-mkchauras@gmail.com>
 <afGUgjRQJgu34Dfh@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <afGUgjRQJgu34Dfh@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 29 Apr 2026 14:51:52 +0200
X-Gm-Features: AVHnY4LAv2pZvQgraP8cIf9jLSC31NFom4mG99W3yyif_zP68nmwU1vFvSNRIOU
Message-ID: <CANiq72k3X34X_fN8cOyE_XWoGF5UQ21FLhxrjZ7AQKWe1a2s0Q@mail.gmail.com>
Subject: Re: [PATCH V15 6/7] rust: Add PowerPC support
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, fujita.tomonori@gmail.com, 
	viresh.kumar@linaro.org, prafulrai522@gmail.com, gregkh@linuxfoundation.org, 
	arnd@arndb.de, tamird@kernel.org, mark.rutland@arm.com, lyude@redhat.com, 
	lina+kernel@asahilina.net, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Link Mauve <linkmauve@linkmauve.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 7:19=E2=80=AFAM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> Upstream Issue for powerpc target.
> Link: https://github.com/rust-lang/compiler-team/issues/986

Great, thanks -- linked from the PowerPC issue:
https://github.com/Rust-for-Linux/linux/issues/105.

Cheers,
Miguel

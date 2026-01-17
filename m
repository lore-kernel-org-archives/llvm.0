Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002901428F4
	for <llvm@lists.linux.dev>; Sat, 17 Jan 2026 19:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768677532; cv=pass; b=Oggwi31dm93qpVbfZLYn5h6STfOLmMhex9E/4bE6mzsVBo2S+HG0WUS9EOOvcVyNFPwy+RaLC23BJZ40rIQNxPtI2Db1AuAMtvOPxGXTWs64CFYnGL/RJJ3acgrJHUvv58bxw+QGNwDWCVQ5hOlKBhGcXQc5fOXGqF5qcwipsBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768677532; c=relaxed/simple;
	bh=4nRx1316BjFdC0wA6dN1j2Nv3iZ/DZZJzDWc/8OJWOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t9QLUM9ywIHQ0UXz5cbtLuqz3tq0ZH4OSYBQfGxkRnbavOfAJGKh8tEwXotU803mPzGvFujnxjoP1/q03VKHmNky8bneWLlIQAc78GYEyl1Nf414bOqY4sndEoma/ptffPed7su2QD/Skym+TRHuHQP7OW7tcMPZiM4GSPYaJuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCk3jB5Q; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCk3jB5Q"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ae2dfd9eefso186656eec.1
        for <llvm@lists.linux.dev>; Sat, 17 Jan 2026 11:18:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768677530; cv=none;
        d=google.com; s=arc-20240605;
        b=im/1RPuXnWBbaJmCL1ZIquspLZMABlrrmcDjzr7XRR3pAIaU/47rtHwQjP4l3qhjuA
         Kh2NEGJKYs+VqccOhECXm0Rl5NPLV7o6xEqenbKYzUv0fGMcWC1x+SX489pkwR4B6Asz
         rK0KhzEX1SIAOgwU63CGRYOn5Tuk2vGB+NSCk2GZuRmfzCnu1izA/6u8PBVnbdKudybi
         VY/E5HMGqACGze2R/492TqkpJvWRgo5BK6p5s/iNd8r225sW0lEsrECUL+xFg2ngmSVU
         fZIG7Euf6NpU3RdqWpJjLrQrANDc/dMPeTqyrg6G8v9RbPLr3koz5SRIUlaEcdGXPggA
         +aeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4nRx1316BjFdC0wA6dN1j2Nv3iZ/DZZJzDWc/8OJWOc=;
        fh=HiwsLaIXcHbAjc8nK7FHiowl4PMPOYh6EPwGDPU64EM=;
        b=LlqhTg3s6lw4d3dHu5GXfR2A7NX0xVzv8XFM7oPX+8Tno18ODIl3/MlNQa+TKC7w60
         uoDMu2RhD8ifbPrygc5u1wHMjoR4W0LT9+GCVNJ/JB1ORyAGDnXibmxk/ooR4H+rZLTm
         ItYE+q3yMQ1MTOmjBh3NhIetxVxGahYBjR5gmAqA4o6/RzZiG1+mBsd4sdJB1X5Lz5Pf
         XOJZ1ikkKHEFyhgS0+EDdOdToPhxopmEM5l1fsO9VbQVxQ1Tp7NZUcfAX9b4gDDTCk55
         iuVFGiiiIULVO+T20BkKH7tpMgB1/wX8hvLKt3F+ogTh7Ig7fySSAHgSm3/XDXOHhUHl
         by9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768677530; x=1769282330; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nRx1316BjFdC0wA6dN1j2Nv3iZ/DZZJzDWc/8OJWOc=;
        b=JCk3jB5QG7WOT3d5CERB8KW+XDuV1iMKxJ43GxRQXSrzuLbKf83ei58b2yZCm1oved
         0F1K8b9Id5/4WORo3teZUa8SG81lCBHV7YTeVqTS8+v9rK8YAEaHh3m+s2AYcPpBFLhe
         LBiAE4MUByzdPnmPBwsdi5Zh+hM0+uYJL+bH8tV3yNH3lPl8VMwHIeJW7O2V5k1RYhWm
         bfUbjAwHqZXqM2iRRsOmG2MwkeraJ8tZIY7iAxqybsXzc/XhjmS18YHjfT1XNfDdEqDO
         xhQMYs0VLWtjZ0S1CBsFvqAPs3E41UOWTZNicuUHl/aR5rd7Xq7Wn2hk6i85EaTSLdxP
         13QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768677530; x=1769282330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4nRx1316BjFdC0wA6dN1j2Nv3iZ/DZZJzDWc/8OJWOc=;
        b=Va3amOpEAUwLUZ1qjWPvWWKE5vK2cdse01zQ5e14eSr3qrsqtIIHMpu4O0OE71cs2z
         iGY69HGYwQxHiq+JbhpqcQPU3grngicSE2CZlYKMVGNNxttKl4qJFU1jJmT48qjTJOUr
         17GD63Ojjsw1lHVb5Id9/gUxW7Rcl/mpMx5t+yTVeHeWDakU5WSx4X2mo5xvWCF8rmm0
         r7qb11fGo+8gwAhAzrITAdgCZDgJxMnUos+Cf67zvBCW3oxIgEK/xAczQtpkbl8reYFv
         wMHYjYAGgKGXOEoFQpTpiAotM2MHfnPQQ8YX5wCJT0OD2ob0I0Bx5Jtns3Qiuvhy6L2h
         GD+A==
X-Forwarded-Encrypted: i=1; AJvYcCVjyr3zirVCeNn9qR1CA3rwf2Z8PyVfyK7lRfPZh2XuMooyqH8I75TQv9lpJezGsJfHEUav@lists.linux.dev
X-Gm-Message-State: AOJu0YzNb0WxyQSKuhUVT5liT18B2RQQjbCxGJE+7ZBYfO/BGvlqFayU
	a0jx4t19kyWnbjTHVxF4hqPBR4GsW27daDqtE6kL+a7CVH/k6XInfpWWb26rRZPGWJwvmDGwN51
	wz3muIG1nDa0lt2X/l3UVS1uJXlQT6Z4=
X-Gm-Gg: AY/fxX5/MJ049jLx4TzSU+9+m8SCRKvETQclMbSf+PfvUwZfX4HylKR/qGcocnI2FQc
	19aFqHx6YW+Bq7l8cFFS1dUfttGgNQpiIIXqW6qi7rALLpvl1P+46+ESaJJewVD/qMSKjAchyVt
	JJCY/KDI4RbMCBjOoNU9Oa+fHVKgFyztXNVcVYOYTnvV4/anhjKQYu2Jo0ha2a2WAlmbe3Cn4EX
	cIit9zEIx8LZnm/zbhCHiZVGRYojD2/TyoHv9z/UFWPeGVdI0U9dn/8n4AeU6xhL+Zz5+Y1wSkI
	QsM80xsAi9JMRI0KCd422Mf/ok7j8d7trn+fvO93BKIQAi+tosI2bbO451ikIV3/Y3lWZY0saGK
	w2670t42K9APfHH1Moyziuds=
X-Received: by 2002:a05:7300:2211:b0:2b0:4e90:7755 with SMTP id
 5a478bee46e88-2b6b41219a4mr2905035eec.8.1768677530129; Sat, 17 Jan 2026
 11:18:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251121193957.1655580-2-morbo@google.com> <20251121195504.1661783-1-morbo@google.com>
 <CANiq72=kqJApbOJ0hmC_mAYe6DO8YqXSFaLJOsbPhkXfxmvJHQ@mail.gmail.com> <20260116083516.GI830755@noisy.programming.kicks-ass.net>
In-Reply-To: <20260116083516.GI830755@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 17 Jan 2026 20:18:37 +0100
X-Gm-Features: AZwV_QiRXF7YOSvgOkGp7Qk7spiRaCAL4aYaIw3HFRjXJ-5zQKZ8PQg_RAG0TiA
Message-ID: <CANiq72mCDAKF+PEkUDHBSNcnfxiAU1oF5RA7zysTbiU+x7m3OQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Compiler Attributes: Add __counted_by_ptr macro
To: Peter Zijlstra <peterz@infradead.org>
Cc: Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Qing Zhao <qing.zhao@oracle.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Marc Herbert <Marc.Herbert@linux.intel.com>, 
	Uros Bizjak <ubizjak@gmail.com>, Tejun Heo <tj@kernel.org>, Jeff Xu <jeffxu@chromium.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	John Stultz <jstultz@google.com>, Christian Brauner <brauner@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Brian Gerst <brgerst@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, Jan Hendrik Farr <kernel@jfarr.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 9:35=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Kees promised to drop this attribute once GCC-16 releases by basically
> doing 's/__counted_by_ptr/__counted_by/' and unifying things again.
>
> This split out state will only exist for a very short while until GCC
> has a release with this feature on.

Ah, I see, thanks!

(even if it happens later, that sounds fine)

Cheers,
Miguel

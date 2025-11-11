Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A68933290C
	for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 09:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762851800; cv=none; b=RlzHcuQSZY78IWNu2jt1XO/j0Ghw4jRh472LDi8UCQKRa02aA/IDhasQatvudae0w1U8tlXao/4sjMD/lwI/pFWo6V+Z2o/IdDtJ3vBUg3KPmZeLRR38m5zzsqfbfFLOslfyF8EIUWIWtBEAeSPq62NL1HMUb6CaxOx2QskXGmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762851800; c=relaxed/simple;
	bh=pvNoy8QjEGF5vDREzb9JJ0U69eI//OHw5iW0XV0TScg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A4Jb9j8PXY7PoeefDo/sxMJwqqNlt/iviSkrgGP4XxoEBZHx0KKzqkY2aXiOFKjLYt9M9e9JXuI8Rz7WiOhvzyPmq5Phr8NRNhrfi5PSERi7UthvjI7wcTBnXiK0CvC8NnSy9jil+/9c63OpAObWf4X0tgNLk4xTzvKubofNy1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zyaxi40p; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zyaxi40p"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-88044caaa3eso41325106d6.3
        for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 01:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762851794; x=1763456594; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvNoy8QjEGF5vDREzb9JJ0U69eI//OHw5iW0XV0TScg=;
        b=Zyaxi40pBI/EYyxPbOFb6o83445yox5tEUu6XkrUus11ZeZG2tHIxMkwd8J4rGVOcb
         t20g4xQ+bFam56NZMA+N1QHAIUlkiDl6M/IM34aNlfymMJsZMDs0e7GCTXfNQ4yof8el
         BnslQkYgmSq/o1Zp6OY+6iuE+JR8hZhHc9W3TiZK8Mhfl/nwKflyPlyrR7CmcE47yzd+
         qaibAhyqY12FwHaTMp+3Sz+2hxT4SKfIWVvJaiT3ebS6KGtLOPoqMdH5fj/Wf6zgFl6m
         wMcMkjlo4Enxvw1XIfYi2LK8bjaDj9hEMPzCoq2v9x6Z15jpDsit3JMZEUZOj6/GST6t
         Gc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762851794; x=1763456594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pvNoy8QjEGF5vDREzb9JJ0U69eI//OHw5iW0XV0TScg=;
        b=M3EIDDGogEU2A3qU1eJkCAEancYZttymxmsD1ze5Q/5aSgR6tVCctA1pthgARELN6k
         YJZ3CevCemK6FIKNA7S+/zi3tBkVK97BOkBmNuQz+QgUMQOj9zDADJOmcBA0a9dyKMW9
         mvz7AEMcimaa41NtOeDbZJPg1a6Gpk/rSTfaDoknmPgOjPHrpaUrCDYOF4jvwpDxfWdL
         ZnTyrEsOGGAcQbP7thOjipnIByh+084ylmtPVO/fzT+ZxE5vWeNd2Qu9ZYd0GPPAeh45
         F+sqH8cWXvx6PwGsDufKg611KXOqyh2Ux6wMXBAWy+aLROuFyhqWhw3V1Cc1AypPZBX8
         6Sbw==
X-Forwarded-Encrypted: i=1; AJvYcCVc/0wwaS+GK5Tv86cOAORHN3JrdNjpjxdPdlufSYO7GlTKnTvW94giIGfFTwlCUwOCXTux@lists.linux.dev
X-Gm-Message-State: AOJu0Yxe6ctylRq2yhaPR0NdjDWjePys82mr/RQX5b2yA+YWv4vb1zLG
	icfNwI2xkgMqsAM2D7nVPFV2jQ2YZxcjUmJURJk52HsaKyeH6jH5HBPRJQIzIpYwCyIZQMKFd9l
	N7avr1no67HWr3wxQ5lSCGQN4HctY9DVioY6CA+RF
X-Gm-Gg: ASbGncvbdFNG6q1uDE92SUeyXrUKMx9tf/+PeDUPbXQItZbMm72IbKSv/jPArgymEj7
	iN1RubcGwyZbDOqIPWmhwg3FXKBw2KXBPATrxpxDto1p1IbOsc6IH2KDNlXZS+mD+sOgKpuK6o+
	svElPeOkgqi8lDXgjZInVdoxfK0Jq4Jec+29jY8xWWkz+3lur/E6z6Zf9JsSEhn26UnzXPO1SwJ
	JQtv2HMoISkagj8koy+o56NjsXirJDwvP8DAYlh8GenyfiAMAuvU247imfjG4vvWGzST2CP0XHb
	veq2Mt4GhHE6IcswzrWmRjDh4A==
X-Google-Smtp-Source: AGHT+IH4F7Ckq32jrbiUxtB1JJ5uFrJqHGgUMRdrFl5ONAv3USRRzhM1TtECqM3yfM33Ue560sqRvq2+UhD4VMC4pSM=
X-Received: by 2002:a05:6214:e42:b0:880:51ab:a3e3 with SMTP id
 6a1803df08f44-882387621d9mr168741746d6.67.1762851793588; Tue, 11 Nov 2025
 01:03:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <0a21096d806eafa679798b9844ec33bf8a5499a4.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <0a21096d806eafa679798b9844ec33bf8a5499a4.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:02:36 +0100
X-Gm-Features: AWmQ_bncs5LVtJN1ReProGRqJJIZk54xNH4kh3rOCX8uWFHvQkLT6YYoepdGREs
Message-ID: <CAG_fn=XQPbZb4MTBUgkJ17gfQL5K1QMahaJ39Mw7Hv4zm1crXw@mail.gmail.com>
Subject: Re: [PATCH v6 16/18] arm64: Unify software tag-based KASAN inline
 recovery path
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, 
	kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, 
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, 
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, 
	baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, 
	wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, 
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, 
	ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, 
	mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, 
	thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, 
	jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, 
	mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, 
	vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, 
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, 
	ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, 
	maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, 
	rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 9:10=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>
> To avoid having a copy of a long comment explaining the intricacies of
> the inline KASAN recovery system and issues for every architecture that
> uses the software tag-based mode, a unified kasan_die_unless_recover()
> function was added.
>
> Use kasan_die_unless_recover() in the kasan brk handler to cleanup the
> long comment, that's kept in the non-arch KASAN code.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Alexander Potapenko <glider@google.com>

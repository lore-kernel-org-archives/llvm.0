Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC010329E49
	for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 09:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762851914; cv=none; b=CZpy9azDh73PNWwzGqiRc/8zZIH9khOFcE301bNdWFuJS4pu5h5hv4vbeAz4Fro3VkvialhPVIjrGLA1vFZPcY5+1yI1r3isHuX7VacjQrLwY5T4lsVbF5mvUYba/07LJxGsBdiFP7F5nolbQbonezTw1zS/CYpWlSg9pYY8Xcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762851914; c=relaxed/simple;
	bh=RciqffmsGUnB8tK3sBcxSnH1zQElvWzvEdnZAAXNZdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVszaPzDzKaHmaEvEqUaUJkM8X5JVnrQcPExbiSi5aOB7ElBZGcMzLao4wfTY2zX/wjr4FZZTcdw12Dm6cbZMdiAoFmG2T3iQEusoy5dsPUYwgypDZu5TS2q+vd4FVqyFQd6ct4Q27kmNG0R2usLBo6XUpOVq7dJkChcWM9JiD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=27yy346d; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="27yy346d"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-88043139c35so40260246d6.0
        for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 01:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762851912; x=1763456712; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RciqffmsGUnB8tK3sBcxSnH1zQElvWzvEdnZAAXNZdg=;
        b=27yy346dnclGiiaRGp0cW0h4aRUIhMbJJEv8Z0DE7jR04AP645d1yf6wL0xx4T/f0N
         M+NfNDcKLhzW8/gtxZoh5+r1wZzH0V4jso2uvenkItRGTJ9jLafacVq01siOZEh2/DUs
         sHxId1RYy3TUqLIuU1U/RTerDQNZwc9/0TkPYRfClJXXZVIIGxT8cTo4ISsddImMc4Mk
         Uy5fHFkOesF/XqPQ5RIWnN++8tl3+PGKHT7GEvdHsb7BNEWk1dRQf+kYPP+Nr/+OWlWX
         Vv2GhHsqsHMrqkbctdkCVraDhJz1UQzVpWnvAcGdmXXbGJSwP4+yGgVtrIvL/FqxYG1I
         n8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762851912; x=1763456712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RciqffmsGUnB8tK3sBcxSnH1zQElvWzvEdnZAAXNZdg=;
        b=FKLypcV0CbN+XveiaPNU+TbF9AOuudfqQcAD/8AvWqMlz2YoYl3ojVds0bW5H0jxST
         BbX0cKwMfBms+JAgC0Yh9MQflYkCAQiyiZFogkZazZwilbMfKKVhJ0QHMeCLxBiqxKpq
         AZ+aAh94F6gcYHxyNxP/8wu7hWSj852fcRkhw2e5rltiXVvI677+I0pQYl2lJ2R+VyXF
         IkWNBm7EbwdBBWExySUXScFtLO5/svpDVjAQX94OUJwgt3P5YXRGRaphSDs7ZLAoAc/T
         1Y+53lOn7YaT4xCaA62M8mu8gZ7gKjSIDvzpfBT38slkBOew1tZn2X0xRLhYXGi+oruf
         8ZzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEXb1KF5FQbN1Ag8YsU4C2IxLoPJKhxkvoAwy53ln/UWUr8nHattkPo40SvAH/WLJTRvRb@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl0u7hC17Dv0PN8ow2Eph0HDgj85Horn458CBmHgvMsst/6WJU
	YHD7Ldtc9EAEb1WJ6dMBRVHLxeN9ZeZ6JhLbU4JX4uHIAJcV1OBwtUSxWXj045JrNyIqYBRBwP/
	QHhhU6t38lFjelJBmjoT1TqD4woFblln/ppyp1jUo
X-Gm-Gg: ASbGncutiJgtdpFcEMDIKR3l29BStsv5l8ItwYouSy0zmx+JHT58Q1kwdtfhSBQLe3i
	20+lbJpQLeq9s1vcboYhh+V/NmEK6K3eTHu69yu2gK2V9ymx6gvXTQHvmAxujSFlosVKyu7TrAN
	+5ViRyar+ffRTEFjToaY0wEHFZ4XABx1IlC0ZfNNxl8QwtmDIlifyg0NWeSPT0/uPpF2ecUV3dp
	oBkbksbgjsIyWtKyESXSf7lkZsPGixJCIvHvKRq1g4gO+kANl38MJiysMhq29oNm6bvknPYlf67
	AkUcEm+kDLmFh4xfqpmUVdNx6Q==
X-Google-Smtp-Source: AGHT+IG5h9zoN8ZgQbNHnylwE6ej/e45pEoTj6YsGsJFK5D5YZvplepfzX5RbzM9p15i6Nqb6Snmeh5EikEQA067P+g=
X-Received: by 2002:a05:6214:d4c:b0:880:56f6:92ae with SMTP id
 6a1803df08f44-882386d7384mr151892296d6.57.1762851911409; Tue, 11 Nov 2025
 01:05:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <96559d5a8e897f97879259bad3117db617e21377.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <96559d5a8e897f97879259bad3117db617e21377.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:04:34 +0100
X-Gm-Features: AWmQ_bnTIARw6amUs-gvSQivLCgG0XY32k4ioUAxykbqmf67HMroMwsIF2IdVwY
Message-ID: <CAG_fn=X5Dr_Dc1pcnAW19zgo7tW8mUSkpDj-v5eaG-awy4S53Q@mail.gmail.com>
Subject: Re: [PATCH v6 13/18] x86/mm: LAM initialization
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

On Wed, Oct 29, 2025 at 9:08=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>
> To make use of KASAN's tag based mode on x86, Linear Address Masking
> (LAM) needs to be enabled. To do that the 28th bit in CR4 has to be set.
>
> Set the bit in early memory initialization.
>
> When launching secondary CPUs the LAM bit gets lost. To avoid this add
> it in a mask in head_64.S. The bitmask permits some bits of CR4 to pass
> from the primary CPU to the secondary CPUs without being cleared.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Acked-by: Alexander Potapenko <glider@google.com>

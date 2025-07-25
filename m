Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AEF2EE99D
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 15:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753457273; cv=none; b=UErUHy4w30OxHESAwtMNzIDV6OsJ7UKPZ/4TnrXLy87oiw1cV+Gc5YQSB7uP+6kp+cdc1FTIz+T987Pv7Xk9S3VN6PZDwoNfmUOq9KGog/MwYzaOey4K+oxYjVabRzc40edMgGUuQjr9DXsFU2MO8buwrCNxkNFT7+hYsiOcWKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753457273; c=relaxed/simple;
	bh=qHHRDqKCIypk5v8SMgVuwGgQI5uVL5DFcbylQ6k7pPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6LhzP+Qo86ZVM9UEk8STIEQRKthMl7C1dmEN6d0UcLYcgU7twEQ/JhGmOhWP1kr6aNtSro1yGJOT3h7kstoCpZwzQRWeFiBrTAIoQfJ7UUFzf66Fsmz23le8SbMD9XnDkU3XXCL4bu2/FBLOvssjElyRWb0xS+3wH4JXLXk8rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EYk1uUir; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EYk1uUir"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2357c61cda7so139705ad.1
        for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 08:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753457271; x=1754062071; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rYghJYglv5xycj6lEIeN8UVfDvdCip7qw6RMPEir5D4=;
        b=EYk1uUirYimpJnx7Qs/XTEch8lJEU2BQkNzXxpkJb1bM2lPYul/VMkmcqz1Y+DOFBr
         JG7DF9jFAEEj2LSXCgs+MzED6PXo1Q5DwjrQgcGFAmU+koSi0Wf9lVgMKx7gSHh31KEa
         lDeSlgXmpuBwPCxS4rYFSKwkMPclgsUC15kx8mke12UX6uq0R63qsxjxyWafXOcbgP11
         /nyg9TUB5BEe/+q2aLkzcHTc7fNnoF1Io5CjnlNi/tHO8sNLgEjSyVOxEQ1lQY36cBFr
         DuTOgb5rBddJvBU+2sq9u9MPfXRS+6+1eHYRXtcg2vY88qauKB/rBdK2lQepDgjnp4Be
         Ajsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753457271; x=1754062071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYghJYglv5xycj6lEIeN8UVfDvdCip7qw6RMPEir5D4=;
        b=TL3OFAo5RFBL3D5FAMUqLdGcnuUCCw4hoMIGGer7YlFxin0gJWUagObdDSzs3WP7eU
         vEHboGBjK8gCtqEf32z7BHfi45Y83Z1QnvD+f1svamhbgvfOTJu74gPCdQlT66mZbyAD
         WYQeCvu2rPIpXJBLk9Ac8f0WnN9x1NcwER+2MW5/+tQUdV8JzRtz70WHOfM5pwPmzcEp
         xOg9Pcr9jE3cRZRMET84Y8QrmUQo4gdmMaxncgBPtw50kVWwPeaM5AARZt9sxxw6Xf+E
         uRPq4hKoNxm2EqoJxcU+NMwBGHNnoTN0zdhEijETy3Mco+dcrH0X3SGGKlbwWBkSRiA8
         d7VA==
X-Forwarded-Encrypted: i=1; AJvYcCVP5EkUL59WCPM4DDtrU5d4jYy752NICQpxpwAZWk3U+dZ95op5czm59BxVQ2y/Ltb+Ao+k@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9CAhShNhTJe8NTKD7kMY86Hr42PYAEAftHO5+2fSdUpDrMjsO
	jUR+GfInXyb3MaR23XQzfXLjnZJOXrQsKlj1ZNI+bycHoO0YR+vnzTpu8kKd3smo6Q==
X-Gm-Gg: ASbGncuBTBNn7o7sj14ipkucMakC71O7onj6TStkWxlwY2EOMbpU0lxblFvO6zQ20bW
	l4VQM2s+bOXUjzl2XFQQ3mXKG4zbZ5S5uDftUiBsgVm1Bh6smH7e95vLwkqnmFnpMUz+lQn3N9a
	W1mOCHwh2vDY1OISXoLtD8uCaIvrKpa76paYNC6puj+nwPSuSkkDRuiaKfHcp4juss2J6gtTmvC
	IjI9cqTFonlcMRi+zjEHNsQ0GJPYr7RbDcNPJwK8ch7efBtlbcccs5oqxaqpZQ/F2qqJR8B4rgO
	ltYFR8kVhuk7UhnNPngh4UHIgE3IGN0HU6Ytb9pk3UluHAWyPpJe0L4SXarRK+LiwmUNBTv1fi1
	VZXbR8Pi/nG8qAOnNukIfctQL7zXiWqP1u9yRiefP57HvHO+2mP570oUR09HGi0gXATK0XrBXs1
	QbUe6MKw==
X-Google-Smtp-Source: AGHT+IECUS4ICPT72rez061zYucyKAEQSZl/Vqzwhl1r3oHDO13mDG6PFiHjVXy9pYhZCAlwaMGg8w==
X-Received: by 2002:a17:903:1a2b:b0:215:7152:36e4 with SMTP id d9443c01a7336-23fb044e610mr2864835ad.27.1753457271064;
        Fri, 25 Jul 2025 08:27:51 -0700 (PDT)
Received: from google.com (106.81.125.34.bc.googleusercontent.com. [34.125.81.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe30ae0bsm225725ad.18.2025.07.25.08.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:27:50 -0700 (PDT)
Date: Fri, 25 Jul 2025 15:27:45 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, apatel@ventanamicro.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	charlie@rivosinc.com, samuel.holland@sifive.com, bjorn@rivosinc.com,
	fweimer@redhat.com, jeffreyalaw@gmail.com,
	heinrich.schuchardt@canonical.com, andrew@sifive.com,
	ved@rivosinc.com
Subject: Re: [PATCH 01/11] riscv: add landing pad for asm routines.
Message-ID: <20250725152745.GA1724026@google.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-1-04b8fa44c98c@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-riscv_kcfi-v1-1-04b8fa44c98c@rivosinc.com>

On Thu, Jul 24, 2025 at 04:36:54PM -0700, Deepak Gupta wrote:
> SYM_* macros are used to define assembly routines. In this patch series,
> re-define those macros in risc-v arch specific include file to include
> a landing pad instruction at the beginning. This is done only when the
> compiler flag for landing pad is enabled (i.e. __riscv_zicfilp).
> 
> TODO: Update `lpad 0` with `lpad %lpad_hash(name)` after toolchain
> support.

I glanced through the proposed signature based landing pad labeling
scheme, but didn't see any mentions of lpad_hash for labeling assembly
functions. Is there more information somewhere about how this is going
to be implemented?

Sami

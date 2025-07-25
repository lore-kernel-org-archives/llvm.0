Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C757080D
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 17:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753462894; cv=none; b=KBFPO6rHPe752rY+GL9IC13x9MMhLIkBIkqSZjy/l5Zo8ZA/GlWai2JSyF+BeLS/ZIqugOOb6uvVrQBt8oZ3oY359WpSyoIL0X2cb12jCUhb7b2XKiBsr6ugvIv2tPomyaqjB5EumCbkY2gD6afXn/DG3X8DnacKDOTp7UKqpC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753462894; c=relaxed/simple;
	bh=ps+zs+NSAsN+PYjwfWa7tJ1eiD1ycr9gRg61OjyMFyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/lEqojeUsEUrCjxwFI1A/2OzPq1vfZoXcgRZgo9Bo0+1XFQDXWswDuaNTSp28kKgkDPNqdz/g0hyaDIeUacy8Zbe3xt4Tb2QsE9A6S5s0YUsTMP4NrKGVrUH9V1xP2cDX8/hPhMs1DJSNJOEaJ54afhAvx+y7vrBo8o4QTzhZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=EhDmchuH; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="EhDmchuH"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b3182c6d03bso2688559a12.0
        for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 10:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753462892; x=1754067692; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ps+zs+NSAsN+PYjwfWa7tJ1eiD1ycr9gRg61OjyMFyc=;
        b=EhDmchuHYXls5aeIQRO6HWyDx6O3JjbJ1vZshpJp2TVAdfeWERXLQWcZMbVMoZW1dE
         wYFHGfUDThTE4J3IIUd4QjB8UwgoRut4YbhbIytiEIJgtVZMxvnPPbP/kh3RDjH7cQvJ
         DtfyZYQIXaGeWn0oMZ1SRLkMTykrx3OyQwTi0zMehJEEa1h9cvG11xOOVgsM8VwPArw/
         yBOBXOMmsxs/4XiCbPmR0aVrrKvW1qFY3D6aVDeUusQCAEbkLIXpNQMaDanCF49w6dKO
         OvlKp0oYRQ0pESsjrEN/TNLTRj8Upl6YpqdSCmRFwSQiK9fFKBbqVeofLXe4dUJfa6zX
         89vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753462892; x=1754067692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ps+zs+NSAsN+PYjwfWa7tJ1eiD1ycr9gRg61OjyMFyc=;
        b=TEq+OnNYFGWrCRu+PcrAVi5QiaUXrv+1HPF3rf3EOZqsCfv10pwe9VddDjGCP0a/Qs
         pEP0hoLKhUlsFVedwgIrA2eOxejgdObZFRmBk2Z673pm8O4npjRMzuZeNfIpbf9R0rct
         JKRXYj6szui5JnGqIKSjRq6PLZTlixWcY/OMdZSNolL6TLS5bpG9+GlLniODOIBM4qS8
         aFZsdukOQcFMs80nCF5id+m19RuMyptdlE0Z3qXrU/i2wnKW1VnCk7PDz9rQMukQikum
         GK7kDo9dA79jFSP6BCL/iVvODWb8FnLU4w+a2Rz9P2fUICqqBrbNYa34hccqDRyd8yf1
         xWHg==
X-Forwarded-Encrypted: i=1; AJvYcCVwJeH5WsMrgz6Miw9MaHUv1/iMZsk5gQzSBI5P7rrElalGtG27UG5AfGOqCiiiTUNgA/xf@lists.linux.dev
X-Gm-Message-State: AOJu0YyN4D+yuQQ4iBH6ezBnmEHrP7lf+d5jI9nHSR78DOfHqxFrm+lg
	UizDDKPFol/98AMGHjovMO6i68MD9z7bPWzDcHDcbRELHue4M5Nzf7WSIDEWA3On3Gk=
X-Gm-Gg: ASbGncsTErqFpPsh23IlczTWXsy0csQDOUDnAg//Tiqk9vr7CWlBTIlDJVwjyUKR5Zm
	ild+srB/k514tIUCOnlDf/9P83VY5YOZEodf61nRNCeJcWYSGAe1taNfFcHyBprCU2AkIy3n/QE
	/PS2tqsws/Tlc9GLR4b9LfJ1kw42AGBDPKKK+JgXlIoUZ2MyunPkq/Riq4bC0rb8tvzQ5gkxF81
	lEuRG8TTLbur2tbNble4ISAxKXrbBcZ4aeWm3LKjcsPWyRkyKEWtPgfW25V0srek3S1FNRqTtSc
	FtmEVJdRbIhOboCNGpjuX/R3LeCvRYEP1SR4YsXkBG0oAnS+73O8NGz9jC6/eoFqQytiBGN+/x6
	avcivJMlsAg3NzEe2vefnNjLc4asoZQQM
X-Google-Smtp-Source: AGHT+IGuTlAbK0hf8yj3kF3pYRz1gmjdG+I1foCKZPdWRPnBU4bPy84CJCnMtZUdxZdhK10DgDBerw==
X-Received: by 2002:a17:903:2b10:b0:234:f1ac:c036 with SMTP id d9443c01a7336-23fb31c4de1mr42286925ad.50.1753462892029;
        Fri, 25 Jul 2025 10:01:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe30bdf6sm1493345ad.37.2025.07.25.10.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 10:01:31 -0700 (PDT)
Date: Fri, 25 Jul 2025 10:01:28 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Sami Tolvanen <samitolvanen@google.com>
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
Message-ID: <aIO4aLLFrMVp_Yht@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-1-04b8fa44c98c@rivosinc.com>
 <20250725152745.GA1724026@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250725152745.GA1724026@google.com>

On Fri, Jul 25, 2025 at 03:27:45PM +0000, Sami Tolvanen wrote:
>On Thu, Jul 24, 2025 at 04:36:54PM -0700, Deepak Gupta wrote:
>> SYM_* macros are used to define assembly routines. In this patch series,
>> re-define those macros in risc-v arch specific include file to include
>> a landing pad instruction at the beginning. This is done only when the
>> compiler flag for landing pad is enabled (i.e. __riscv_zicfilp).
>>
>> TODO: Update `lpad 0` with `lpad %lpad_hash(name)` after toolchain
>> support.
>
>I glanced through the proposed signature based landing pad labeling
>scheme, but didn't see any mentions of lpad_hash for labeling assembly
>functions. Is there more information somewhere about how this is going
>to be implemented?

Take a look here for generation of type string
https://github.com/sifive/riscv-gcc/blob/f26ae78e21e591f78802a975b68dbde9a224a192/gcc/config/riscv/riscv-func-sig.cc

For hash scheme, take a look here
https://github.com/sifive/riscv-binutils-gdb/commit/1d027fd590c8ad79eba997bcf9b979872ff38eef
`riscv_lpad_hash` function has detail about how 20bit hash is extracted.


>
>Sami

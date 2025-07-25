Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F3C1E8337
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 14:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753452982; cv=none; b=EtKpaUAiDuOUW8tTVjaNoXxBte8tkYE7aSwhAIhqSb4aWtahlyKdmGf4DVzYP+8DYwoON/rKq74x7g9rJCkeAIiUAG36Ra5TO8JvqsK321C1f2X372qNXrQdL6QrjT0YREX/G6OKFujRB6ctLtSn0wG8aCZ/aw2zzsReY9lS1Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753452982; c=relaxed/simple;
	bh=rXtgRj8Lg0EC5NCvL7q1D/HDUV15yXcudNMgmUup6uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSkjdfD7ubWVG/WGTMoyeaYxsl5UN+6wQyksdNHjfbjNkiZ1t9w//Ae10fwr4oVLBMjxpG/6axjI5P93qkJJRzQ/VKwMrRCzI8eZBQ3D3phqLMuAGggvA6Zg9uNC8p5s/Th6rcdKZ4Rzy8QS3BvA5YDkYH6elmTSwOXoGWjz5JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=dRMym/69; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dRMym/69"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235f9e87f78so24161505ad.2
        for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 07:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753452980; x=1754057780; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m4zb8NrY5OXi5r9Et0ByFU2sSCQJb+4fxBPaABm8ZNI=;
        b=dRMym/690oojreTOSA5tYnZ9NCKVMdnpvhejvODDwpNSn5fSk+IEkXMtjdQnLWYiDW
         PpwzqUc/jJTVN75YZg6dJ2LItYgm7r9FmZLgWEE7HdU6CSI4LYepureDkK6E7VbbfbPp
         8ecInoQ27+cv7WSY5TraH7DNpU0xp7HQIXI70e5uaxy5CDOwg/TzaJSi/Y+awmYXYUrP
         BYsdjHefQvEUISEC2xPPOS5EftGr6HNUCiqoMLgCnps+Lxns6n+KUCS622vSdJDup8d7
         4YyWRBz/oduxdyfh2aIYKFiK51OoT+1y7HbeebQqneQtUumGq6xQb+0KTENMOVujiWRy
         3Bww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753452980; x=1754057780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4zb8NrY5OXi5r9Et0ByFU2sSCQJb+4fxBPaABm8ZNI=;
        b=grFurT+SQi016giUjivIxP1ShXeg99ouXL7EItWTLJHzNlmEvmJtSbJFuTnDDfKinj
         yGLYfzZSQON9muUvvqxdnPVHsd/7+X+GVoe4VU4F32XL31j9vau6M5jrH2qcAsjE4YUI
         S12jj5UVvDBd2D4PzmgLY5h04iDNucNGbYpe/5w+8GicmFt6m3/P2eRtoul3w9MrRZTu
         etv9vPJhnlk6t7BMhlDR5Ie9wDtg0oWrmSuLMKxEkUT4Tyt+xSYl4SaT+LfKNTYyRtlU
         1THvgBNgorBINdRRTtgXEHHGDwH2VrL4JyZV7SMH2T4UwiaeXJspDGkl3eNG/99DivjY
         V9sg==
X-Forwarded-Encrypted: i=1; AJvYcCWNEcU9MDb+otL/iKuYQP+uKnAuuJ39uZ3Oa3KUXMEZUT4pQlSBMLSBbzX9d99dbZATeZ/e@lists.linux.dev
X-Gm-Message-State: AOJu0YzsPp/EyfpzD7qwUBKp0BgfGQRzMiXSzMVVFkX3mldpAC/MTx5D
	NG+u4DCQlMD3FcZkp3mzUdou3eNr6W032gDE+m9gqgu0hGenIlF783ozmE2cNNbWiJ4=
X-Gm-Gg: ASbGncv0uNEtQmfzqi5GuVkazj3JyrsEqy7V1r1PLLi22AUBbKZ5o/gpN1xadw4tpVF
	XwjJD/t4SZckU90gmOUpFNyJq8EVrCd4SXp9s6q7KzFi/owDzIpyMHJzTQbDuyGZmAJC76ktIfi
	fTm1v0q4bD3U55hz5Krv9t3HFw89gb+q8zSnbviJs73xXbmbXmnoYODNVmRaxVnC1IPb54Hllas
	kvpd4j3iH1Ge/vvcw0QEA24mgV8NLMq2DlIRNRUzZFxgZSmhbxvCDQv8twofwA/cQMskH1e/28X
	HfixdEvN2oSqfzOYxKYZEOsWOCRQ5s4G/7EKX0V50iWpKDCiqvst+wdSL46DY/JzdcYBH539UGy
	5kgb/CmbSlbmw0RUhQo6HwTGaftJuljev
X-Google-Smtp-Source: AGHT+IE9XuwrXVXrIfvlI3DBKUdukDNvmbxm+Ndq+/QyLjAd0FPi4mKe09kh/NBw/3BKfUdqYZtXMQ==
X-Received: by 2002:a17:902:e5cc:b0:234:eb6:a35d with SMTP id d9443c01a7336-23fb30acdedmr35114765ad.27.1753452979529;
        Fri, 25 Jul 2025 07:16:19 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa491bb2asm38450025ad.213.2025.07.25.07.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 07:16:19 -0700 (PDT)
Date: Fri, 25 Jul 2025 07:16:15 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, samitolvanen@google.com,
	apatel@ventanamicro.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, charlie@rivosinc.com,
	samuel.holland@sifive.com, bjorn@rivosinc.com, fweimer@redhat.com,
	jeffreyalaw@gmail.com, andrew@sifive.com, ved@rivosinc.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
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
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH 02/11] riscv: update asm call site in `call_on_irq_stack`
 to setup correct label
Message-ID: <aIORr7mQSbV8QMCq@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-2-04b8fa44c98c@rivosinc.com>
 <4ad699fc-a89d-4740-bdec-ecb9a2134c90@canonical.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <4ad699fc-a89d-4740-bdec-ecb9a2134c90@canonical.com>

On Fri, Jul 25, 2025 at 08:23:44AM +0200, Heinrich Schuchardt wrote:
>On 25.07.25 01:36, Deepak Gupta wrote:
>>Call sites written in asm performing indirect call, they need to setup
>>label register (t2/x7) with correct label.
>>
>>Currently first kernel was compiled with `-save-temps` option and
>>normalized function signature string is captured and then placed at the
>>asm callsite.
>>
>>TODO: to write a macro wrapper with toolchain support.
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  arch/riscv/kernel/entry.S | 1 +
>>  1 file changed, 1 insertion(+)
>>
>>diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>>index 2660faf52232..598e17e800ae 100644
>>--- a/arch/riscv/kernel/entry.S
>>+++ b/arch/riscv/kernel/entry.S
>>@@ -389,6 +389,7 @@ SYM_FUNC_START(call_on_irq_stack)
>>  	load_per_cpu t0, irq_stack_ptr, t1
>>  	li	t1, IRQ_STACK_SIZE
>>  	add	sp, t0, t1
>>+	lui t2, %lpad_hash("FvP7pt_regsE")
>
>In patch 1 you use lpad 0 due to missing tool support for signature hashing.
>
>Wouldn't it be preferable to have a first patch series introducing 
>landing pad support with lpad 0 and once tool support for signature 
>hashing has landed create a second patch series using tags?
>
>Such a first patch series would not have to be an RFC but might be 
>merged soon.

It's mostly about security guarantees. Coarser grained cfi (only landing pad)
has been proved many times not that effective. Kernel is a monolithic piece of
code. If there is a good chance of adoption anywhere for labeled landing pads,
its kernel. If it becomes a long pole, it's a possible direction to go back to
unlabeled landing pad.

>
>Best regards
>
>Heinrich
>
>>  	jalr	a1
>>  	/* Switch back to the thread shadow call stack */
>>
>

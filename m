Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1345D7B
	for <llvm@lists.linux.dev>; Sat, 16 Apr 2022 16:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650125268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ygFHjusU5vVIgxwTuSPuzqVHkbPskMoNhTMRJVlo0kc=;
	b=g8tfN/TuW78ajNDBN5ePYACSytL6sjdVXSHyMqNW5xBU7Ru8mYeeBP8DRise2G5fk02H1K
	JSXOid2J0CoPYbooTWhAq/BuAdKSB8vw51OtzaueNhkBZqu3iPxUc6M+lG8CZggCsuZtQC
	62wLttLdENIqT3RSURi02+jfgaqSJZk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-rg4j4VB-Ni2n62QEULvSiA-1; Sat, 16 Apr 2022 12:07:47 -0400
X-MC-Unique: rg4j4VB-Ni2n62QEULvSiA-1
Received: by mail-qv1-f70.google.com with SMTP id t12-20020a0cea2c000000b004443d7585f0so8894222qvp.19
        for <llvm@lists.linux.dev>; Sat, 16 Apr 2022 09:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ygFHjusU5vVIgxwTuSPuzqVHkbPskMoNhTMRJVlo0kc=;
        b=FRRjwq1RTAGN3s2gNrJAzpOCbA0IsrT7/Beuk/Xmz7p9rUeIXAzjZtVRNVs5aUDbSY
         R6L4XDKrH0jOCCdSVoxI/Nobz0ZJpHlx7nVp2I6NxnLN0VQWPEaAMWtwVKojJnYr+Ue9
         cDfozoqkjbTcaLIf7YdbniKFQMBiwYHKVCZubOEfxXUcflhJcEB0WXZvw9RznaxF2C2M
         wpDQBfotNiSo0dNlCD78iY+kVHKqJ1zCC5J2xgZIgZ2GTEX3Y4cusXcDQBTYByg00gFu
         y8FLJFMC9UqI9kdJ7YCvplr7/evlmrQ4ammUHK8BQry81riAXPKUDKjvmPOUJivT8xdJ
         Aqqg==
X-Gm-Message-State: AOAM533TiWet6HXT7BAijKu1lAKboQkVcP6QywTkYRc3eFMKIlQIvLPH
	alHzKlssW0oeLMY6IJ31ubjd6/jtAWCFLvHA/9gGMkcIzUdFhqhls4oUA71kvAuhtwhVp4QowT8
	Qi79aUZ4+B2mfHg==
X-Received: by 2002:a37:657:0:b0:69e:7b77:3973 with SMTP id 84-20020a370657000000b0069e7b773973mr1159711qkg.298.1650125266821;
        Sat, 16 Apr 2022 09:07:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzghEJU1kF01A712yCjgkafh8IeNuahjzXNfG/n5mhzThe/gAiUQ40HYF9Gb3gbt4JTzVg5+w==
X-Received: by 2002:a37:657:0:b0:69e:7b77:3973 with SMTP id 84-20020a370657000000b0069e7b773973mr1159701qkg.298.1650125266570;
        Sat, 16 Apr 2022 09:07:46 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::45])
        by smtp.gmail.com with ESMTPSA id c136-20020a379a8e000000b0069e5df9d953sm1999991qke.34.2022.04.16.09.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 09:07:45 -0700 (PDT)
Date: Sat, 16 Apr 2022 09:07:42 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, x86@kernel.org,
	hjl.tools@gmail.com, mbenes@suse.cz, rostedt@goodmis.org,
	linux-toolchains@vger.kernel.org,
	clang-built-linux <llvm@lists.linux.dev>
Subject: Re: The trouble with __weak and objtool got worse
Message-ID: <20220416160742.6g4nejji4xyrgpvp@treble>
References: <YllUqPK4CWZeHku8@hirez.programming.kicks-ass.net>
 <20220415152633.GA2731@worktop.programming.kicks-ass.net>
 <CAKwvOdn1JVxxithobr=15hkumoQ51CjnPSbrq8hYBRm=A3L5kQ@mail.gmail.com>
 <20220415182130.iltk2uxnubeaa4nk@treble>
 <20220416104809.GC2731@worktop.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220416104809.GC2731@worktop.programming.kicks-ass.net>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Apr 16, 2022 at 12:48:09PM +0200, Peter Zijlstra wrote:
> This *might* work for static_call. But what about things like
> .retpoline_sites?
> 
> If we get an indirect inside the weak function and at
> a different place inside the non-weak function, then we end up with two
> patch sites in the non-weak function.
> 
> And since all of that is compiler generated, we don't have anything to
> stick anything in to alleviate trouble.
> 
> (in fact, I didn't observe this with static_call, I just picked it for
> the example because it was somewhat easier)

Ok, right.  And ORC entries will be broken.  I found the ones below by
disabling CONFIG_DEBUG_INFO and looking for "sym->bind == STB_WEAK" in
the elf_add_reloc_to_insn() fallback.

I guess objtool will need to bite the bullet and create section symbols.

  lib/clz_ctz.o: warning: objtool: .orc_unwind_ip+0x0: missing section symbol for reference to weak function text
  lib/clz_ctz.o: warning: objtool: .orc_unwind_ip+0x4: missing section symbol for reference to weak function text
  lib/clz_ctz.o: warning: objtool: .orc_unwind_ip+0x8: missing section symbol for reference to weak function text
  lib/clz_ctz.o: warning: objtool: .orc_unwind_ip+0xc: missing section symbol for reference to weak function text
  lib/clz_ctz.o: warning: objtool: .orc_unwind_ip+0x10: missing section symbol for reference to weak function text
  lib/clz_ctz.o: warning: objtool: .orc_unwind_ip+0x14: missing section symbol for reference to weak function text
  lib/iomap_copy.o: warning: objtool: .orc_unwind_ip+0x0: missing section symbol for reference to weak function text
  lib/iomap_copy.o: warning: objtool: .orc_unwind_ip+0x4: missing section symbol for reference to weak function text
  lib/iomap_copy.o: warning: objtool: .orc_unwind_ip+0x10: missing section symbol for reference to weak function text
  lib/iomap_copy.o: warning: objtool: .orc_unwind_ip+0x14: missing section symbol for reference to weak function text
  lib/crc32.o: warning: objtool: .orc_unwind_ip+0x14: missing section symbol for reference to weak function text
  lib/crc32.o: warning: objtool: .orc_unwind_ip+0x18: missing section symbol for reference to weak function text
  lib/crc32.o: warning: objtool: .orc_unwind_ip+0x1c: missing section symbol for reference to weak function text
  lib/crc32.o: warning: objtool: .orc_unwind_ip+0x20: missing section symbol for reference to weak function text
  lib/crc32.o: warning: objtool: .orc_unwind_ip+0x24: missing section symbol for reference to weak function text
  lib/crc32.o: warning: objtool: .orc_unwind_ip+0x28: missing section symbol for reference to weak function text

-- 
Josh


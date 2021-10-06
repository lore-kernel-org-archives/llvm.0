Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AEB2C80
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 03:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633491391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ocTbFKq103vOIaZqsII4pq9sEvQMfjZwJU9h1aYvFtM=;
	b=fJW5ww9STcVBlZRftf8PfkFbyFd9sRK5r8oZ7J3RCtWMM1GaNLBLLrqbzezf50KR4yngM7
	Q8kBe++6ds+3eC/xwIaUaM4kQD5/OvqHWmas2Qne2VYGrqPsKNlvIpsWze2PILk0bGW0h4
	KGf8Iz4JrvF6/QfH5NEB9HezH3bkqGs=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-aqILxHfgN0GqLEzDtb2GqQ-1; Tue, 05 Oct 2021 23:36:29 -0400
X-MC-Unique: aqILxHfgN0GqLEzDtb2GqQ-1
Received: by mail-oi1-f200.google.com with SMTP id w26-20020a056808091a00b0027630e0f24aso915982oih.0
        for <llvm@lists.linux.dev>; Tue, 05 Oct 2021 20:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ocTbFKq103vOIaZqsII4pq9sEvQMfjZwJU9h1aYvFtM=;
        b=Bqs9qASaqPvIcotunhwmfkMBNEsbmd8Nfg4E+UMx+WkbBGxX5ho4mUA7Jy9Q8K9NGR
         AlSCMWcYW/Einisuz6eqaLmpW1kW5qv+4xR7AOKnx2Gy8qY4z+4+CPkxlFE7654DBvTO
         41lxLg2vd16mrRLnaXz2EFt/owIU0mr+/ZD03e9SI3QSoyG5zSrPQGgqhv3QmCsFZy+p
         MLlnQZaa/z6k5necOJKHw4TCJyhWhxykSCwtnrPsDnRpWOipTdvIFO9PPtrxxcP4vXx2
         Iit7/JYaFaVmpce2IZ2ipVhFmpQtWigB38A1zdOdHo5pP/ZPARhSvBXYCnOnX8Gezcg6
         7OQw==
X-Gm-Message-State: AOAM533b18Q5t/JImiqRPmsRD/7PG4h5KIZSiCHDJ3rEuf1wMyzSglDJ
	xrg+sgTT2XLAsbQA0iybJDUcQ5vl2Iw+pdCjR/mgHzj04LXu8ELC/Soo8haj0kJPthCT3dP1Ah2
	85+DLlgjFHkGdYA==
X-Received: by 2002:a9d:6f9a:: with SMTP id h26mr17536536otq.140.1633491389170;
        Tue, 05 Oct 2021 20:36:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKxtRBnxeTiOX8KiHZzT+dQc7fjHh0uxJjbeVdjRDFW+QbyWzR8kELBvGkFwZ2NPtqHJm7Ag==
X-Received: by 2002:a9d:6f9a:: with SMTP id h26mr17536525otq.140.1633491389011;
        Tue, 05 Oct 2021 20:36:29 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::15])
        by smtp.gmail.com with ESMTPSA id o8sm4008393otk.76.2021.10.05.20.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 20:36:28 -0700 (PDT)
Date: Tue, 5 Oct 2021 20:36:26 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: x86@kernel.org, Kees Cook <keescook@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v4 01/15] objtool: Add CONFIG_CFI_CLANG support
Message-ID: <20211006033626.hfjke5jrvvzxhc67@treble>
References: <20210930180531.1190642-1-samitolvanen@google.com>
 <20210930180531.1190642-2-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210930180531.1190642-2-samitolvanen@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Sep 30, 2021 at 11:05:17AM -0700, Sami Tolvanen wrote:
> With CONFIG_CFI_CLANG, the compiler replaces function references with
> references to the CFI jump table, which confuses objtool. This change,
> based on Josh's initial patch [1], goes through the list of relocations
> and replaces jump table symbols with the actual function symbols.
> 
> [1] https://lore.kernel.org/r/d743f4b36e120c06506567a9f87a062ae03da47f.1611263462.git.jpoimboe@redhat.com/

I found the original patch description to be much more useful than this
one ;-)

-- 
Josh


Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C9321D77
	for <llvm@lists.linux.dev>; Tue,  1 Nov 2022 23:07:56 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d10so14826269pfh.6
        for <llvm@lists.linux.dev>; Tue, 01 Nov 2022 16:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4hzrs2JtUwGOjaOengdaNzpSa9PDpmjDB1uY9BKaG18=;
        b=Pi9hwo+vMzQw3RURoG81hI9tUFyAfoPZyhWJnOYk0hLdM5fRYC9zgOqEkTd8D5cL4u
         f7zbsuEZP+MGM9r0Q4etkIAMGAvsOg50uayS16sLaxK4HNCsxCSXmxciwCJ2pBD07Qa2
         aJFCVFiaoaiM78uPOd7qxeHUtUBCBk0yA5Df0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hzrs2JtUwGOjaOengdaNzpSa9PDpmjDB1uY9BKaG18=;
        b=sBJIXD5W13ZuHUVFcY4R9x2KhhoebNyQMfvfXCbvrM4HBXeaOA7xYr248nXViGixB2
         0ZBcmWCWL2Q4xFNVckd1Nm+BX5widS8fBNx03RfTjM1iBFspG79kWzzA31pWR7867J13
         yOKgtz8TTrkwBJf7td0VENnM19TOrY2Nnnf8VpMwOJh9IuT52fdEIpOIsePSUVocMJUW
         m2IRsm5RhdSEtPU4i4+jGQA4WdzuFE7Cshfwblgl914yC1I3UjSbaUDBIoqhkRKv+MMt
         Fr2mcu58eB8rJi+ll6Sy0JUZBuOrOEKNMeS+jsJMrLguQxH4xK9u6nSAHu/SY2B28Ijl
         UwEg==
X-Gm-Message-State: ACrzQf0ej2oWvMfeFx1gs+y4+B5L5EdqTNpQqhc+0sfOHhwJbkz6X0/8
	2mgrNNoDAmLS1V+yD5G3FtPjxw==
X-Google-Smtp-Source: AMsMyM7M6H5/TVn9fRrJDxFZE+XrRJk/D7/3VkInJuDFAyQHPIeK+l9/08jMdsvwrIfc4l/i6NudaA==
X-Received: by 2002:a63:5307:0:b0:46f:b6e1:1f15 with SMTP id h7-20020a635307000000b0046fb6e11f15mr11975152pgb.163.1667344076487;
        Tue, 01 Nov 2022 16:07:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l126-20020a622584000000b0056dde9895e2sm1373910pfl.30.2022.11.01.16.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 16:07:56 -0700 (PDT)
Date: Tue, 1 Nov 2022 16:07:55 -0700
From: Kees Cook <keescook@chromium.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: bp@alien8.de, tglx@linutronix.de, mingo@kernel.org,
	peterz@infradead.org, Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>, dave.hansen@linux.intel.com,
	David.Laight@aculab.com, hpa@zytor.com,
	linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk,
	llvm@lists.linux.dev, luto@kernel.org, mingo@redhat.com,
	torvalds@linux-foundation.org, x86@kernel.org
Subject: Re: [RESEND PATCH v5] x86, mem: move memmove to out of line assembler
Message-ID: <202211011607.C9814760@keescook>
References: <20221018172155.287409-1-ndesaulniers@google.com>
 <Y08NJohEeoYX2aIf@thelio-3990X>
 <202211011534.C31FC5ED6@keescook>
 <74ab03dd-46c5-a79e-c256-e4e4ea0341e0@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74ab03dd-46c5-a79e-c256-e4e4ea0341e0@intel.com>

On Tue, Nov 01, 2022 at 03:58:03PM -0700, Dave Hansen wrote:
> On 11/1/22 15:36, Kees Cook wrote:
> >> Tested-by: Nathan Chancellor <nathan@kernel.org>
> > Can an x86 maintainer please pick this up for -tip?
> 
> Queued it here:
> 
> > https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=x86/asm

Thanks!

-- 
Kees Cook

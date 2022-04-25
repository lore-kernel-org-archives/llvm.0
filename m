Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500E37A
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 04:02:00 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id i24so13653305pfa.7
        for <llvm@lists.linux.dev>; Sun, 24 Apr 2022 21:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XpqXUKQnBMu16RDI3lug4RWsduF9+QynmSZQ3BCqjAg=;
        b=dRi+fDayDSsY4PNuZojPnc78erUng+iTE61/if5JtS9deSN5Kue2wbhrHWwIRwJsw0
         uRKEZZq2d0oQzKHVnCMa+BOIAhpyczU4b1XENcA2or9LBLCAtYiCZYYq11m9+wW1Xih0
         verUXesH6xwXZ5u2pAD6egcZgQusy+7jzrSrE7OoiMcDDzSwFe8aMcoRWHp4fjNmTRmA
         IKNo5CcXN7Ns1IIHoBFMPFPtkda9PFAsAnyKWLvDR6Sf2qaRswCR4XdyNaJFEehVfSPE
         TKsXlCXUT4IcnDYXQGMWIITz1O+Mz2yFdi7ymEn16nHtPjZf9g17a2rf4RX2LI777YXb
         JXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XpqXUKQnBMu16RDI3lug4RWsduF9+QynmSZQ3BCqjAg=;
        b=tzEwp/DhfNw1FpxNckodC4NL5Rqt3Yxw2YRnd3pQZO83v99bedgU8WfwyG7agbrAwR
         J2KLjaJ4MI9q+qbNE2EDHafT90QBJvogbhUqHbRys96yxePTOvBZbEq5wa2AnM1PMReQ
         d3itQbyBIrPH53SkB1N3IHf0hMQhSk8F7tnXDTDOFwvD1he0kIAq1rHcblOSwBjdqEPM
         10FfFore6csfim8wC2IHKJdN/9FQEsj+lApkbrHdFk2BFLQ5c+qbcVZPW/C8b2eaHEOT
         Eq7uN9eeb5P+i3R/jrhYncpv9m3okykEaePlK1yACGNps8OehhODfK0o8+ZDbYoGQccA
         VEgg==
X-Gm-Message-State: AOAM530wvfabVwRRpQIIPWWgdUp6upwkEpzJDsvhrKpQDj4yaJb/l4hp
	6Am3g+epSYFwNU1sFxr55Ms=
X-Google-Smtp-Source: ABdhPJx3mcsUbCjgVIlR76wYqJ8xMmU4F0udievDmHkC2+5Ct4NkT4XlJe7M5Vsc+lyReFF2m1CQvA==
X-Received: by 2002:a63:fc18:0:b0:39c:f431:8310 with SMTP id j24-20020a63fc18000000b0039cf4318310mr13368460pgi.433.1650859319693;
        Sun, 24 Apr 2022 21:01:59 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:282a:d50e:e0fc:c145])
        by smtp.gmail.com with ESMTPSA id g14-20020a63200e000000b0039d9816238fsm8004385pgg.81.2022.04.24.21.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 21:01:58 -0700 (PDT)
Date: Sun, 24 Apr 2022 21:01:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] Input: aiptek - remove redundant assignment to variable
 ret
Message-ID: <YmYdNLCRKZtuZG6D@google.com>
References: <20220418142457.84708-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418142457.84708-1-colin.i.king@gmail.com>

On Mon, Apr 18, 2022 at 03:24:57PM +0100, Colin Ian King wrote:
> Variable ret is being assigned a value that is never read, it is
> being re-assigned again in either path of the if statement. The
> assignment is redundant and can be removed.
> 
> Cleans up clang scan build warning:
> Although the value stored to 'ret' is used in the enclosing expression,
> the value is never actually read from 'ret' [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied, thank you.

-- 
Dmitry

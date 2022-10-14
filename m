Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BE94433
	for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 21:11:09 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id w74so6393189oie.0
        for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 14:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cmlOf0WqP2VWIwHpJCvrVP8vGAHC8knpaj2VRfeMJhY=;
        b=kT//KpxazmxKcG8BccpbLlEUszMt7W6sRdNWUNgi767RCrjVfHxwQ8ylH5jehyXtb+
         xtaVO/eKiUmdkoHc7Vzpm36ep4ZS/rWa0YjVaYp+fIib0CjyrIG+0TXSMXuwyaQ7GVdQ
         zdNeHdmlynEP/J5JMB/GOz2gyHad5VO24oIHcLOqBQLfZ/ALXpgz1ufaP56r/i8CSGdx
         ft7D5XvqqVQDjUUxEOehBltLTFJYLhAmjwdisuRXs27fQ64gNrx3j3ZAHo1rdN5oJQys
         D5Uu1dcG+NdvyetcauB+6TbfEga3OJEIhT4+A4bKnnlon1WVhnYX6sdCob0n9XQnz1Ag
         ePIQ==
X-Gm-Message-State: ACrzQf0Cr/bYHTMEN3SsCjNFCUeMaUENCCHC7R+mqb/9j7cz4DifuR3w
	DekY8oSkBgYOhY6Gf/OWqw==
X-Google-Smtp-Source: AMsMyM5GyjLi8iHeCcE1tstB3RqHJ++cloFXkmlshA3SqL6w/+hImWx0FxD1VAug2ShRqCJY7tcXaQ==
X-Received: by 2002:a05:6808:118e:b0:345:9c3e:121d with SMTP id j14-20020a056808118e00b003459c3e121dmr3480660oil.211.1665781869043;
        Fri, 14 Oct 2022 14:11:09 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n6-20020a05687001c600b0010c727a3c79sm1772322oad.26.2022.10.14.14.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 14:11:08 -0700 (PDT)
Received: (nullmailer pid 2912846 invoked by uid 1000);
	Fri, 14 Oct 2022 21:11:09 -0000
Date: Fri, 14 Oct 2022 16:11:09 -0500
From: Rob Herring <robh@kernel.org>
To: Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>
Cc: linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, Frank Rowand <frowand.list@gmail.com>, llvm@lists.linux.dev, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] of: declare string literals const
Message-ID: <166578186819.2912776.6771227036062685821.robh@kernel.org>
References: <20221012174622.45006-1-cgzones@googlemail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221012174622.45006-1-cgzones@googlemail.com>

On Wed, 12 Oct 2022 19:46:22 +0200, Christian Göttsche wrote:
> of_overlay_action_name() returns a string literal from a function local
> array.  Modifying string literals is undefined behavior which usage of
> const pointer can avoid.  of_overlay_action_name() is currently only
> used once in overlay_notify() to print the returned value.
> 
> While on it declare the data array const as well.
> 
> Reported by Clang:
> 
>     In file included from arch/x86/kernel/asm-offsets.c:22:
>     In file included from arch/x86/kernel/../kvm/vmx/vmx.h:5:
>     In file included from ./include/linux/kvm_host.h:19:
>     In file included from ./include/linux/msi.h:23:
>     In file included from ./arch/x86/include/asm/msi.h:5:
>     In file included from ./arch/x86/include/asm/irqdomain.h:5:
>     In file included from ./include/linux/irqdomain.h:35:
>     ./include/linux/of.h:1555:3: error: initializing 'char *' with an expression of type 'const char[5]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
>                     "init",
>                     ^~~~~~
>     ./include/linux/of.h:1556:3: error: initializing 'char *' with an expression of type 'const char[10]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
>                     "pre-apply",
>                     ^~~~~~~~~~~
>     ./include/linux/of.h:1557:3: error: initializing 'char *' with an expression of type 'const char[11]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
>                     "post-apply",
>                     ^~~~~~~~~~~~
>     ./include/linux/of.h:1558:3: error: initializing 'char *' with an expression of type 'const char[11]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
>                     "pre-remove",
>                     ^~~~~~~~~~~~
>     ./include/linux/of.h:1559:3: error: initializing 'char *' with an expression of type 'const char[12]' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
>                     "post-remove",
>                     ^~~~~~~~~~~~~
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
>  include/linux/of.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!

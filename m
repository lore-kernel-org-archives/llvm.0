Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C432F4A
	for <llvm@lists.linux.dev>; Sat,  5 Mar 2022 20:32:57 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id kt27so24307020ejb.0
        for <llvm@lists.linux.dev>; Sat, 05 Mar 2022 12:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TM7AJ3oV8U7FFNZXKPP4XmzZhp+z4fppZRqXUBC++Es=;
        b=oxAiU4WHINe5aXbVEEPXKwclHX/bukULVnkmG1gef5WWbxTnrrBZjNtWaNjTLfWlIB
         MPyr3S8/NnwZFQEJvnYuAhJZJE8XQbxfkBbv22C5Xy8DfuERg0cTrZlyFup+wWP/3j8b
         evjRuIwZu8y3fP/rnhuoY4ohH1QcsPg8T/IGatQSQsNV5uYOa8P5PFdERiDMgtkwXu+/
         DynafjDZQIBVYM8bKq8RfgR91qkSvNpWKB4f1AzeK6zkExI13uLfLcy2z8olLecG38Wi
         kLTnffmOMU1ZNRo14VVrr027wlB1k0fwc08MKmDpPljJwfQmJoku3NZ8UdiuVvHv260G
         y64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TM7AJ3oV8U7FFNZXKPP4XmzZhp+z4fppZRqXUBC++Es=;
        b=oXjNspwqs0XuLgxAEEtXTlH/5S4vpOl8/aCO5CnS0hO9uoguDNx895owlSdS4iC2UT
         GuXlud3kmvEFB9/qXhPdWiOlvPYALuDx2m7ny2pDZkbRH/m6/NsEiexj5b+NhgjO5y4v
         /RiRIMg7cEQwsc/slBvftsFSFnaWyNWqK98EvAo2ugdfT5iEGJTjou+97N+lqJ6/JQfB
         22//WgjYqw1YS/s7dtGddwGGkALkyQu60Lz2VtZDQzj0gXBw0ocbL76BxLCu7UehNjmn
         V5SVReySWU8BiRoQPsOFKXSuEmjND9CKIUSmvriFJsAgRiEpi477AgkHq0lLGNLuVvCq
         ctpQ==
X-Gm-Message-State: AOAM530XAzSEw4jEPQ1Xr1dXo385mPjzpV8SYRZ2ynUU/FCHex/lt1bX
	b38kO1k09TEXozy1ydrB7U4=
X-Google-Smtp-Source: ABdhPJxp8ix2jRhbPodIgYkSU2BgAit7LXO5fGU5WCq3I57X+GzY+E7e81UPuJgiCKquWySlcwTc5w==
X-Received: by 2002:a17:906:4313:b0:6b8:b3e5:a46 with SMTP id j19-20020a170906431300b006b8b3e50a46mr3854405ejm.417.1646512375685;
        Sat, 05 Mar 2022 12:32:55 -0800 (PST)
Received: from skbuf ([188.25.231.156])
        by smtp.gmail.com with ESMTPSA id y12-20020a056402358c00b00415b3d2b79dsm3856201edc.97.2022.03.05.12.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 12:32:55 -0800 (PST)
Date: Sat, 5 Mar 2022 22:32:53 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: trix@redhat.com
Cc: andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com,
	davem@davemloft.net, kuba@kernel.org, nathan@kernel.org,
	ndesaulniers@google.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] net: dsa: return success if there was nothing to do
Message-ID: <20220305203253.jso2wergnn5c7fsx@skbuf>
References: <20220305171448.692839-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220305171448.692839-1-trix@redhat.com>

On Sat, Mar 05, 2022 at 09:14:48AM -0800, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this representative issue
> dsa.c:486:2: warning: Undefined or garbage value
>   returned to caller
>   return err;
>   ^~~~~~~~~~
> 
> err is only set in the loop.  If the loop is empty,
> garbage will be returned.  So initialize err to 0
> to handle this noop case.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

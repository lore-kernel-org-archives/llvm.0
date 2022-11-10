Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02834366
	for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 14:31:56 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id h14so1648537pjv.4
        for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 06:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yKZ49Hq5cxRBRGuGWZmrWmyUCChzQiTYq0wPx6wHlvc=;
        b=EHHqa2wvLN4L0h+BDA+s7vsVb5mNPysYohstSXuowrBlnagzJejUduUwbh+UwOJGma
         sPx4kJMLuI/Sf5LBbDMOPEtM8+HvB+lA5eUWBNSuFFS6a/c0nCaYcGxerABB3rMzLRDY
         npaxx1QtDVmujfUgvXcRQclUJek9MYBes323s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKZ49Hq5cxRBRGuGWZmrWmyUCChzQiTYq0wPx6wHlvc=;
        b=uAexQQo/L5ZWkSrz/EIDF1sF9DVoNJ02DJqldjQFLXHmrl+OMKwM1t85UPqjc5DAyj
         Cd1VKPpBH0EoUmWOlZ/LW73V459JCdCZuyBxx8sTLcw32TqTDLs5deWPz2OK6GRsVvss
         +x/KvkQvC48rw1YqOtkxw5MNTDyG6yvsj3EvlEG1t+NxNroD4QEBfHbXEv9SeMHTI58u
         0jUnp5zWy9ncz3zGZLDZuTxcr1YKUDhkIWKYmgUPFzA2O8sCSkFGP6If7LPJ46dyfobV
         QzhpbzflNrjYYFTgcKwzWlAXahxteiQvB6GvYJ8TiJufjMuOBZR+TdRzobGQ8yZKKa9D
         R0uA==
X-Gm-Message-State: ACrzQf1J4JP66uhb4xMzk+wNb/AF1jUgjbSjQ5mxspaGMliroORj4qXc
	3tiNux1jnjecSYnQLovxL+Oo5g==
X-Google-Smtp-Source: AMsMyM5FM6+Inj4VnlE00+/2ySDhZb9ew7QK2Sfkx1aMTS/XaSkyEbT5L3/ntwCsotmKq8D+ABCOoQ==
X-Received: by 2002:a17:90a:784c:b0:213:5b03:62e with SMTP id y12-20020a17090a784c00b002135b03062emr65667417pjl.241.1668090716334;
        Thu, 10 Nov 2022 06:31:56 -0800 (PST)
Received: from google.com ([240f:75:7537:3187:2129:96b6:e6b9:b930])
        by smtp.gmail.com with ESMTPSA id p189-20020a6229c6000000b0056c08c87196sm10192940pfp.48.2022.11.10.06.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 06:31:55 -0800 (PST)
Date: Thu, 10 Nov 2022 23:31:51 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Minchan Kim <minchan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nitin Gupta <ngupta@vflare.org>,
	Suleiman Souhlal <suleiman@google.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev
Subject: Re: [PATCHv5 04/13] zram: Introduce recompress sysfs knob
Message-ID: <Y20LV+1jJMZ2FFnM@google.com>
References: <20221109115047.2921851-1-senozhatsky@chromium.org>
 <20221109115047.2921851-5-senozhatsky@chromium.org>
 <Y2z4DbuYgDJ/v8u+@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2z4DbuYgDJ/v8u+@dev-arch.thelio-3990X>

On (22/11/10 06:09), Nathan Chancellor wrote:
[..]
> drivers/block/zram/zram_drv.c:1894:10: note: initialize the variable 'err' to silence this warning
>                 int err;
>                        ^
>                         = 0
> 7 errors generated.
> 
> Is the fix just to initialize err to 0 as it suggests or should there be
> a different fix?

Yes, that's the correct fix. Thanks for catching this. We had "err = 0"
in v4 of this patch set, but it somehow didn't make it to v5.

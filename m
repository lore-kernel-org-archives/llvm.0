Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECE7168
	for <llvm@lists.linux.dev>; Thu,  6 Jan 2022 06:25:12 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id x194so1755419pgx.4
        for <llvm@lists.linux.dev>; Wed, 05 Jan 2022 22:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lJpNPWZbNxA6hjcR5adyIR3AyFHec39t6NTKjP75kD0=;
        b=ih4/ZHixgiiP8sfoqrZeTYEItZ2rUUhJEaElVwE21+BvDJJaayvcAt8PMTcR8thCXH
         qJITdYvB1B1MEh67ZdsV/UDDztEa2IRGvDwxLBb8DGWGIiUbeIr4TZfreHcWBX2C0leo
         I38Ep0uh+4b3sl8ZtTPU5Wefe+ApdKKZMU2GL9Ae5D/HzkRNpG1f6ZP3i2YgWVpmbP4h
         wpGF2ttGseoXMFdq+RL06iN9PPJrdzbjQtymstX5p+hQJwPOnKXjrwmYR3xZCGkIHCQf
         PWcOducPqBGl6EbqH5ir4Opj8mPzmTV+/r29nVBWa8DscrimLmWHAtOnArBTLiWQslyZ
         WToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lJpNPWZbNxA6hjcR5adyIR3AyFHec39t6NTKjP75kD0=;
        b=fiKdI24xFsYCXnB0C2WRLSncF5yMDWbKcmOGmG4iumeXvGYGyH9TVRNLqRKYXwpgoq
         r78Fc42zDq+I2G/ex6DBWXi7lmr0y2m+ZrdJ+NUdBuoAB9N60ogx+Pe49Fl3poBLUyn0
         pTjvyX7O1nBucLGZbfYuFDodIBoSIJiJytZRAyzBwBtBB8DqptaG2zlDhNRbe/gfdV3J
         +vPCi0t/ZGThTEYB4wIIehCxqZAOBq/PBzxfynejQd5U2MXPBVePYrBHzq55oBsnDDv6
         8B9yJ4lFYB+xhcGuIL1TeU8yh6JcZPptEV+upprVij5eYQWt7Jub0A48VjVtswwBrp9n
         zMrA==
X-Gm-Message-State: AOAM532WmTGCRAqRmwJzR++Y/8c8aW3hbzKbuNKh0/GPicmB9IT2ukEo
	G9l2iKFLhgjnomZ8ei4U4S0=
X-Google-Smtp-Source: ABdhPJy26nZrNTcpuyuraN+LWje2VVKmMlB5uMW4T//o5qWordaPb+KlHt5kkJ+r1dMbf6LxO69nQA==
X-Received: by 2002:a63:751b:: with SMTP id q27mr51270111pgc.184.1641450311864;
        Wed, 05 Jan 2022 22:25:11 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id z18sm1103889pfe.146.2022.01.05.22.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 22:25:11 -0800 (PST)
From: xu xin <cgel.zte@gmail.com>
X-Google-Original-From: xu xin <xu.xin16@zte.com.cn>
To: alexandr.lobakin@intel.com
Cc: cgel.zte@gmail.com,
	ndesaulniers@google.com,
	keescook@chromium.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	nathan@kernel.org,
	torvalds@linux-foundation.org,
	xu.xin16@zte.com.cn
Subject: Re: [PATCH linux-next] tools: compiler-gcc.h: Keep compatible with older GCC versions
Date: Thu,  6 Jan 2022 06:25:08 +0000
Message-Id: <20220106062508.619587-1-xu.xin16@zte.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103144635.5952-1-alexandr.lobakin@intel.com>
References: <20220103144635.5952-1-alexandr.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> GNU C    5.1

> This applies to both HOSTCC and CC.

> > Undefined __has_attribute as we built the whole kernel and tools.
> > 
> > To solve this, this patch is given to keep the compatibility with older
> > GCC versions.

Yes, but I think this error is a little unfriendly to users using a 
lower version of host GCC when cross compiling. 

Perhaps "#if gcc_version > = 51000" could be added to avoid the error 
'Undefined __has_attribute' 

or we can add `#error "hostcc don't support _has_attribute` to remind
the user of the cause of the error.

Or just use my previous patch.

I hope we can do something here to promote the situation as Nathan talked
before:

https://lore.kernel.org/all/91B93D4D-BEC8-4ACD-B71F-27C54D8B1B78@kernel.org/

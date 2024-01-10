Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26432610B
	for <llvm@lists.linux.dev>; Wed, 10 Jan 2024 03:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H5quVJER"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6ddeb015ec6so659470a34.0
        for <llvm@lists.linux.dev>; Tue, 09 Jan 2024 19:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704855729; x=1705460529; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zFPPL62mMn6CtToI83E7n0O2MKG6z8XFWD/fwB1/NlU=;
        b=H5quVJERdqPlzTFc+525mRbsIHwgQabprB+zd2Gi3TBOtQkVoeE0FGF/By/yikNyMG
         8+17ckZ5IeesgGiVdwyaHm+Af5vVICJiu/tJFZJd0z+12vAopNDB9LWLiDmWwg65sUlz
         LppPQoKMK6rxkdcWDk+EyacYCyEQN/XcD7/zI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704855729; x=1705460529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFPPL62mMn6CtToI83E7n0O2MKG6z8XFWD/fwB1/NlU=;
        b=N9WsQHAEFOXa5k1mmCl1aN/jCTAuoez/RKrDHVFqNNl3L1/6xU0lAHo1ra0bnUrVjN
         aCvRX2PWUXCq2hkNJR2vJ4nlHo3qu89V9T3lzWjSOk8LkRn56zNqsY/IgH3STRJdAwL/
         SYIAndCAtJMNwMEALF+8pGrmspmjAK+m2TUssYXYxzygMpWGDz3zo3fpSgXVobn0fSBH
         sGrzm46h6xUfhE6QUEG9xQ3JLfPVNUN+Vy4z9b87mUnwT4PVWCjdmlYY/ulA6qZJ4LwJ
         nAxPQbpEmM2xG3Na1WTRi7q4TL7KSj92EDT44IQe5ZrAPqaMI2gADKBFgTuUzTSbKx95
         7U1g==
X-Gm-Message-State: AOJu0YwCYS6s+XfTA94PndouGai4N4nZkTx/oK9iROoQYtIb+bDWbrm8
	wsqOPwj/iCKbH0XgpmMI7ht4kmhqSB4m
X-Google-Smtp-Source: AGHT+IFBMS98ev18K5CCqSy+R0w7E8zpE02hjacSLoes1p0CoPx0LYl4OIw0a8QDivY2BnRe7IVZHg==
X-Received: by 2002:a05:6808:11ce:b0:3b8:94c0:87fb with SMTP id p14-20020a05680811ce00b003b894c087fbmr440439oiv.9.1704855729132;
        Tue, 09 Jan 2024 19:02:09 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:b1d0:e755:54c2:4518])
        by smtp.gmail.com with ESMTPSA id s7-20020a056a00178700b006d9b93ca5e2sm2442043pfg.146.2024.01.09.19.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 19:02:08 -0800 (PST)
Date: Wed, 10 Jan 2024 12:02:02 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Miguel Ojeda <ojeda@kernel.org>, Kees Cook <keescook@chromium.org>,
	"Gustavo A . R . Silva" <gustavo@embeddedor.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] Compiler Attributes: counted_by: bump compiler versions
Message-ID: <20240110030202.GB1282549@google.com>
References: <20240109133633.1103876-1-senozhatsky@chromium.org>
 <20240109153249.GA205400@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109153249.GA205400@dev-arch.thelio-3990X>

On (24/01/09 08:32), Nathan Chancellor wrote:
> 
> I should probably go through and try to update all the other
> review.llvm.org links to GitHub as well...

It might be something wrong only with the counted_by() link
(https://reviews.llvm.org/D148381) as other reviews.llvm.org
links seem to be working fine.

I randomly tested https://reviews.llvm.org/D75044 and
https://reviews.llvm.org/D123515 and they don't 404, unlike
counted_by() link.

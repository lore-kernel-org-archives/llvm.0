Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD767A
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 05:04:29 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id n15so11744558plh.2
        for <llvm@lists.linux.dev>; Sun, 20 Mar 2022 22:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rWn5lOEVKhm+FQ6md1T7NJaCwXARs2ppaRXQ0ISSujo=;
        b=Z6CZCluY+X4TE/5PAqyM+8g2WPrypjmBsL4y9z7MyQq3tnZf1i78nZxX+Ig3SqfwVs
         d3CkCW/Qzu2bBiDBkxAAE8BGkeTniraV8l7JRVXOYpd2umcmF8xuq3lyIr9zHM5pnmmA
         ezJbzllMjrutcx6j0MQ+FFw6Ge/1ee7xP7BAkBI0fb1WvpjtQOpyvWPprZl2sdi2799w
         sFHZRZbTeNZDsaFdReL81SbPcdaJuGm/MBF6sswlFx3SJ+//oI/mrFbA75jOxReJxtiU
         9hDsg0vzu271i2j++j68tVZe3DHzbVM4LGX2AmeMNgTkLrUKfVdD3jJ2gJFTrCcMvSGH
         V1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rWn5lOEVKhm+FQ6md1T7NJaCwXARs2ppaRXQ0ISSujo=;
        b=8NGsEIrxl3AXnMiLaXhRyckzQGIKhqYUPsmF1kcrhdHkECxMTi4S3oHUxYP88JfyQy
         JUqp7lGVImKW2YpgsFyB0lFwKd9Pgnv/JCwuYsXJ11PPTZumDcDBoArluL/X0mTkiLeE
         SYP/fkaLnv099Wp1ak+d6MGY/mRfH2IfXFhrHCJHsLCRGhBtjwiJl97wiKLH1NCp2qcc
         +FgfmqGc67d7/QqdgTM9mG8E94Kqj+8I/qddUcPkHFDRRuiMztwtIE9sJVQEBkbIzsFT
         6Crnya6cD8JslsBGfb3t4w+0oVoDq6EPPrshTEk3w3NXyFgQNq/J1LlF/qiJn9wL83Cy
         9+Gg==
X-Gm-Message-State: AOAM531Ss0uq79viwhf4ySv6WSK7Z75sMnQRbh1REyhsG7CWmC7hokg8
	pPKMFteUzrN67sqHUAp1K2lu3QztKVU=
X-Google-Smtp-Source: ABdhPJw3GsuYmAvFujOtsMEZmTIiI8Ukt+Rrq0Zw7bPrTEkxB9B36nuwkv85fIHGkT5k+pTveYeOEQ==
X-Received: by 2002:a17:90b:4f92:b0:1bf:25e2:f6af with SMTP id qe18-20020a17090b4f9200b001bf25e2f6afmr24103584pjb.98.1647839068735;
        Sun, 20 Mar 2022 22:04:28 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:31f6:c8f1:6f10:b2ec])
        by smtp.gmail.com with ESMTPSA id d5-20020a17090acd0500b001b9c05b075dsm18659405pju.44.2022.03.20.22.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 22:04:28 -0700 (PDT)
Date: Sun, 20 Mar 2022 22:04:25 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] Input: adi: remove redundant variable z
Message-ID: <YjgHWeTiAWRty3rK@google.com>
References: <20220318002318.80519-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318002318.80519-1-colin.i.king@gmail.com>

On Fri, Mar 18, 2022 at 12:23:18AM +0000, Colin Ian King wrote:
> Variable z is being assigned a value that is never read, the
> variable is redundant and can be removed.
> 
> Cleans up clang scan build warning:
> drivers/input/joystick/adi.c:139:6: warning: Although the
> value stored to 'z' is used in the enclosing expression,
> the value is never actually read from 'z' [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied, thank you.

-- 
Dmitry

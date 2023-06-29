Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E6914269
	for <llvm@lists.linux.dev>; Thu, 29 Jun 2023 19:00:18 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-666e6541c98so973284b3a.2
        for <llvm@lists.linux.dev>; Thu, 29 Jun 2023 12:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688065218; x=1690657218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RzTSZl4ZrMV7S9CxcKysPR5GZsJOMyGfyeQpbnniNwY=;
        b=bYMJnnMVkMD1qGU3V/p2Ksfzduhx5dbgVJffIfoqMFs2zQyvuRMkPgL+1BjBND7Muc
         Jcam2Ox77QJytBsj2kM1hw+xGiYGSBwXNo9sr6RzzrTeGKQiPC8WsvifCXYovFYAH8iX
         8wXcab/QlDRfTxuLZB3G+PdjQ5GcfjrTk25jY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688065218; x=1690657218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzTSZl4ZrMV7S9CxcKysPR5GZsJOMyGfyeQpbnniNwY=;
        b=hoIqu2kc9NwQdOkWqkkVKYKy51xFSxCpEPc7c/m455MuaYYC32deA5LyAET8xUH6ll
         hLq9NJ876nGJrba2j4b8ERUhkPPL7uTpIGryn+iNUOZTYjCxCSywkwIT/OsVPDvVZjzv
         jG2pnYqfiafBKezY+DpGsfolA19jn6iD97dU4am5sYTIPf2FHzDdf6dk37u3O68nFmnS
         8B6O2hOOLTUgCv8Wk/GD1WQ4NudrIqB8NmiITSGXH1WLOJjlHZvkVWmdR3Jg62f4Nu+4
         5CNcvQYw8aie8iVR97MnZQ2jTr+MjWHZksBZTVBvtAQ3ydLdHIx+ApjdEfMlklsRozap
         MyIw==
X-Gm-Message-State: AC+VfDy8qccW4uVnLj8/QUgPGrRHBvXewmvpiUcUNR6ZqzwreW0PMOHm
	/Cskhmld7fQGVhhcsbMBMPN25Q==
X-Google-Smtp-Source: ACHHUZ6UmgnsuBwbjXdkwkW0c7gX7XjDQZrqe1/4vO5USaZh7WQ07jAviGsUCR0heTlL1OVpHkpx3w==
X-Received: by 2002:a05:6a20:a10c:b0:11d:9307:8acb with SMTP id q12-20020a056a20a10c00b0011d93078acbmr408192pzk.45.1688065218303;
        Thu, 29 Jun 2023 12:00:18 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id w2-20020a636202000000b005439aaf0301sm9060262pgb.64.2023.06.29.12.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 12:00:17 -0700 (PDT)
Date: Thu, 29 Jun 2023 12:00:17 -0700
From: Kees Cook <keescook@chromium.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>, linux-usb@vger.kernel.org
Subject: Re: UBSAN spat in valid xhci code in Linus's current tree (6.4+)
Message-ID: <202306291159.44DFB7CE6E@keescook>
References: <2023062945-fencing-pebble-0411@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023062945-fencing-pebble-0411@gregkh>

On Thu, Jun 29, 2023 at 05:36:51PM +0200, Greg KH wrote:
> in include/uapi/linux/usb/ch9.h

Oh wait, this is a _different_ one in ch9. I'll send a patch...

-- 
Kees Cook

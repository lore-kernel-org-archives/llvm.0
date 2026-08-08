Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BF8366DD3
	for <llvm@lists.linux.dev>; Sat,  8 Aug 2026 18:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786215386; cv=none; b=C4IBQz18aryE2mbZi1/Tb0SLQwwe0WY312w+35uLI9AL+iy5wBK1Olr1ZzNcB/7+sgiS6RUeJLxImub6s/h0RWbFZ/ezsLrPNbmYMrcA1cnG233msxpFL85amLEKshPaEtVLgx83FHaL9IVo/oNUT85a0IqAJoZ6t4de2ddlxXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786215386; c=relaxed/simple;
	bh=jt0CBXp8WcUUorJ0KKx4EhLw0aaeXfTBGhliMIdwuN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUmG6CXzWfFFlV9kyvJsl3FFHpE7ipRjnhak9Hl8ftooPeyQCn4O4XIFtzFdktDGdqHeY817xBbK9+OiD0r4gZ3s5wEGo4cdT6yi1qGrglzP8BrUYt4AGBlWC+sEnteMVYVn+9TRaFJ5ayZKDxVtfcqDIniV65i3tUbge/k/bdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmWedTIr; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmWedTIr"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-471eeac43bfso391655f8f.3
        for <llvm@lists.linux.dev>; Sat, 08 Aug 2026 11:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786215383; x=1786820183; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=epz4WzR4olYum1LjcNWONz3yBFUsB2U9LGw6V0cZMD0=;
        b=TmWedTIrpcqua5oUhxnu02XfWRXuk3DTnl1B1BsjJtTRaMzCdH9L9AdoXHNRxQmE75
         cUbSIFw8Z/g5svksnkFoiXonBQDLEXTyT6IsgWCY18oJ1iFUE+pBINCBkZPeQ6QEZ9wI
         VDgfQjKWU9SYGChV7ZqlJ6ibZ61OhQbkjje0u2WJVuYYKC2+VEvJwU/YIE3izHdxs8Va
         sn46trlCp+ZE95PqCmjBVe6PUPBWEkOGphc21AIWg7q+Cy9WC0dQv0mNigMbz8R8Zq40
         TbKsBTkXeWrSKVinubv74h/61gdbSogQTdTwZN83/ZOSs00xiUs0psiwaj6Si/x+io3L
         Ujlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786215383; x=1786820183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epz4WzR4olYum1LjcNWONz3yBFUsB2U9LGw6V0cZMD0=;
        b=MHNfWKqnGm3oZBtBx1U+nbYiYcrHrEM/KYx63EtJmKKRzuhXyH8cfo+Z+GoWuUgAw6
         LaXWVsG/wM/vBgSBW0mG4m2KpDo9LbjLwwXMQNaxvo8TWE/t+2vLUzfECvcy+nFyHfjS
         2rdFkcPZr1IrbcqOWhe9ZXo2Fj6jshTHavtKI83mA2GwM9eUNkycQPEd/ZysnBXVcf7l
         zz++2NHtjryyN/ytNwKuO9huQKvpnKEDs3wJaHKyEEQyBMvPLSUmK+u4eRP6MLJL1hAW
         KFs3SHfKT9bMS27PLXsYrxzh/AyG32ggt2ONi3GuYsFOqLPvm8jCv8vfOUX/7gzeS0it
         snQg==
X-Forwarded-Encrypted: i=1; AHgh+RrRSUN/K51UrFDoNpeAM+dI6cr+vTTE9lD4AnDN8WyzsUhdyl8MuphFFiwBZbOqSAFw515+@lists.linux.dev
X-Gm-Message-State: AOJu0YxWYIA4ncvpHmcGEuvHBpRHm45wb/cWxrKkSf+JPOQsFShfnSm7
	wBz7SfzUGPhMdq/Y1N/5TzKLiNnlXwUsP/qi8JWtzeVxmrd4sGzzQ1Ia
X-Gm-Gg: AR+sD13lfMdmAyIrqjxyJv6dpR4eXPiAjDfzuUkW/AtfcsRvXSlpO3sgDkLBM1MRlw5
	Js8UF0YeO2AcT2UEjYTu4R26MWMISdByRNLGlnroU8bI1K8JwgQr5IzTdmH0U1MHTXZttCvdSLh
	TwgSavZHSwYv3ktdbw0ajvz5jsRCl4s9JaueXzZdE4A/HY8gvW/OyCSqTmKYxaBlW4jYJyAyCA9
	0MFAwN9INyy/piOpU735bOLa/4mEKU7t6Ag9dz+jsrUC1Ts5/8v310khAUcuFiUysbPUO3VO1lx
	10+JN/24q+myV5suTq+KU1zqgfpsCETuXa0lIkqqUKC346nPE8Z8bKk9Kfqd1fDJ2HNzywppvF5
	Jey1sjpHx7lV5CLAWGl4F2uFeSTt88vKMrzUAOSxv/6Taf514pokDcAzB6OZ8aEM9LJnTfqqlMz
	Xf3+UmJNhFM9rjXi5MWTrHfuomHfZbNSfcdtjwmDnIXQnIcX3B+Vm65PN6VZD0xmrG7qzfL8MTM
	sBIprrxBJz3nwzqnXKHYc/+WgmdFKquGEhCxRlPVMM90+U/RfkN8ae5cUSWaCpahXoOlvDOMhEF
	/JpJ8TZpGdPAtIaPLpXxLnaIXAINi4nPkME=
X-Received: by 2002:adf:f345:0:b0:47f:8487:a686 with SMTP id ffacd0b85a97d-47fec6337cdmr38621374f8f.23.1786215382892;
        Sat, 08 Aug 2026 11:56:22 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-077-007-004-134.77.7.pool.telefonica.de. [77.7.4.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800220ab11sm18061796f8f.35.2026.08.08.11.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 11:56:22 -0700 (PDT)
Date: Sat, 8 Aug 2026 20:55:50 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Wei Yang <richard.weiyang@gmail.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH] lib/interval_tree: fix allocation warning messages
Message-ID: <and7UN_Cx1IwU3fP@gmail.com>
References: <20260808123608.73613-1-kmehltretter@gmail.com>
 <20260808105005.de1bcf3aff8698f818879053@linux-foundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808105005.de1bcf3aff8698f818879053@linux-foundation.org>

On Sat, Aug 08, 2026 at 10:50:05AM +0100, Andrew Morton wrote:
> lol, OK, thanks.
> 
> 	fgrep -r 'WARN_ON_ONCE("' .
> 
> finds more.
> 

Indeed! I already sent patches for the other instances to their
respective maintainers.

Thanks,
Karl

Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF102CAB
	for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 14:39:03 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id z5-20020a17090a8b8500b00210a3a2364fso5865314pjn.0
        for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 06:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2PGUxq/3jr/sRYtdOzve4iX/PaZyflMzPk7cd+r6fN8=;
        b=cfHSUeylFvDkPA50hnFYS1kPYhccS/gXTdhk7dZcWCY4605DOV1f4Xi273Lj/y6vOy
         m4h1gHDigu+arY2xQfOtUwQz988fUn9JRzenlO8tBvu/aFyi19PxZDBd86c+m7XEEfqY
         eURXFhAT5EqdnGpQoYJ901hNlQrk0pxuDqQbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PGUxq/3jr/sRYtdOzve4iX/PaZyflMzPk7cd+r6fN8=;
        b=n5FvR2Q02Un7UVPSAN0xREwTrsMXiuXEGDt+Bcat7Tc4I184M9lfxy05rFruc/IYVY
         onG2JAyXxXN8XPDIsyzmqtTOOj4tLgxvOUV/famlgIkNxWgh0Ch5znDlvd1VG6XDtG+8
         9GPrONABaKVt7XKoEG8pmE49Ky3SVdQNuqNxIoVD4zBWEqwg9pYDiuHw0gwHR86eqPa+
         DMvLPhrKkHY+T9q8QpzKpQpsgGzyJ+pfITtKxQtOfHlsiCg+ZNM+TMzU70AutUejcKII
         vVkqpwhlmLzJlQBUXL+/aPRN5KC5iP8+KN50LYNj6I39Xy4d0JDtm0pHVbtXgmDGrflJ
         ByKw==
X-Gm-Message-State: ACrzQf2H+HwuJizQft4OZEWQN8bX5XVf5Dm9cmvEIfAjw5ve1VwVY729
	cT7QoO+mKmbGhd7LyJDM/U/x0w==
X-Google-Smtp-Source: AMsMyM7cQ+Eg0HOXosvU60zj4qjXokv+g7kNRrpz9O7C0hdw5QOxrd11RmRIwahFoKAXxzBg023KCQ==
X-Received: by 2002:a17:90b:84:b0:213:de0c:1253 with SMTP id bb4-20020a17090b008400b00213de0c1253mr58789136pjb.74.1668091142796;
        Thu, 10 Nov 2022 06:39:02 -0800 (PST)
Received: from google.com ([240f:75:7537:3187:2129:96b6:e6b9:b930])
        by smtp.gmail.com with ESMTPSA id w25-20020aa79559000000b0056b8181861esm10601355pfq.19.2022.11.10.06.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 06:39:02 -0800 (PST)
Date: Thu, 10 Nov 2022 23:38:57 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	Suleiman Souhlal <suleiman@google.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv5 04/13] zram: Introduce recompress sysfs knob
Message-ID: <Y20NAX4R6RgRpWnE@google.com>
References: <20221109115047.2921851-1-senozhatsky@chromium.org>
 <20221109115047.2921851-5-senozhatsky@chromium.org>
 <Y2z4DbuYgDJ/v8u+@dev-arch.thelio-3990X>
 <Y20LV+1jJMZ2FFnM@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y20LV+1jJMZ2FFnM@google.com>

On (22/11/10 23:31), Sergey Senozhatsky wrote:
> On (22/11/10 06:09), Nathan Chancellor wrote:
> [..]
> > drivers/block/zram/zram_drv.c:1894:10: note: initialize the variable 'err' to silence this warning
> >                 int err;
> >                        ^
> >                         = 0
> > 7 errors generated.
> > 
> > Is the fix just to initialize err to 0 as it suggests or should there be
> > a different fix?
> 
> Yes, that's the correct fix. Thanks for catching this. We had "err = 0"
> in v4 of this patch set, but it somehow didn't make it to v5.

Nathan, I just sent a simple one-liner patch. If you don't mind,
may we ask Andrew to take it as a fixup (folded) patch?

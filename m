Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com [209.85.221.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F112559D
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 13:03:22 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id w128so5103463vkd.3
        for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 05:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BTl/pAfD1lZ0h4IgEDgvVGkksy8JHT3RGVdO1p5rBwQ=;
        b=Ldlxx9hDrW/D5mRexfK07vpqUm5TKE1VpzQKjQkvjhcAorAkHxxa7tI7JSaN+VYHl2
         6a6uEMH9oYAUOYiRQ5xkzVa8jS9+O0DhVRfm5d/jiLroorICFA2Ff/w5AtFCtdwI6pdN
         /A0fGyTwiWs7/iQuqK/tlooufyT6Txb+CXQOc7ej4befc/04Zg6+v3U0XIwiHc99+XBj
         2A2ajw15zY6/xRky38XIiREnuty1P6+Yq29yomZsZakkcytIVfer+PMhYP/sP4wy6hC5
         y71faSoQcslmZRT8Tg3qJel1E4QqIoFAzu6ke6t2rsRKwHaTvYwzmQ/7bLtPDKQj8ij3
         tqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BTl/pAfD1lZ0h4IgEDgvVGkksy8JHT3RGVdO1p5rBwQ=;
        b=VFPwMydSc8zPxHCcOrfBkp8bCnAAfTCaqM62ppp30lNfBIQIgZD3g+tTvXX2cKW30M
         cQ9AKDp8ITyjEYIEvEOEMbmT6KnSzQaVOFJPj8omzKoWxRJ8YVv4csHWSYdJDlGbTeel
         a4F07zdBXLVYvF+2eK4XZ5LaJUzMVh3vpWDqFrvc6rRGBfuu/Svs4/GD7nW95UK5envd
         s23P9pxQoe+k1YnrdlMOOA58NkrTkvhzQWfH9gHA7mnbrWEr6ro/EYBZpF/XdzeEuRyl
         bB2buvyZYidwodoQu5+R/FIExq7OmGTyztqxP2TPpI6q3GQr1nTWDOw20iTiia29ySLI
         Cy/w==
X-Gm-Message-State: AOAM533RXbHqhpeVYKgA9d8yA1GSi/5Hw2WUYeV7+xyAj5lgyiffe+6T
	dtjG+oysQeH7NUwtEJ8e/uI=
X-Google-Smtp-Source: ABdhPJyHAUb/sh2pkS8vXWVikPEH8kElNCDS41yRTb+JNO4AIHzANImpaNBvQfUKfI2f/vXi912Qqw==
X-Received: by 2002:a1f:ac04:0:b0:32d:710:5930 with SMTP id v4-20020a1fac04000000b0032d07105930mr7901130vke.6.1646053401150;
        Mon, 28 Feb 2022 05:03:21 -0800 (PST)
Received: from ishi (072-189-064-222.res.spectrum.com. [72.189.64.222])
        by smtp.gmail.com with ESMTPSA id e20-20020ab02b14000000b00345f0381ddcsm1886237uar.0.2022.02.28.05.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 05:03:20 -0800 (PST)
Date: Mon, 28 Feb 2022 08:03:18 -0500
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, trix@redhat.com
Cc: nathan@kernel.org, ndesaulniers@google.com, Jonathan.Cameron@huawei.com,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] counter: add defaults to switch-statements
Message-ID: <YhzIFofXbnbFe9N6@ishi>
References: <20220227161746.82776-1-trix@redhat.com>
 <20220227174610.0e0e73e4@jic23-huawei>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220227174610.0e0e73e4@jic23-huawei>

On Sun, Feb 27, 2022 at 05:46:10PM +0000, Jonathan Cameron wrote:
> On Sun, 27 Feb 2022 08:17:46 -0800
> trix@redhat.com wrote:
> 
> > From: Tom Rix <trix@redhat.com>
> > 
> > Clang static analysis reports this representative problem
> > counter-chrdev.c:482:3: warning: Undefined or garbage value
> >   returned to caller
> >   return ret;
> >   ^~~~~~~~~~
> > 
> > counter_get_data() has a multilevel switches, some without
> > defaults, so ret is sometimes not set.
> > Add returning -EINVAL similar to other defaults.
> > 
> > Fixes: b6c50affda59 ("counter: Add character device interface")
> > Signed-off-by: Tom Rix <trix@redhat.com>
> I'm fairly sure this one is warning supression rather than a fix as
> that type u8 being used in the switch is storing an enum which is
> set only by kernel code and all values of the enum are covered.
> 
> However, that's not locally visible so to me the addition looks good, I'd
> just be tempted to drop the fixes tag as backporting this looks like noise
> to me.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Yes, this isn't really a bug because the only values available are those
from the enum, but I see how this is not immediately obvious at first.
If Tom has no objections, I'll pick this up and drop the fixes tag so
that we have it along with the other counter changes for the 5.18 merge.

Thanks,

William Breathitt Gray

> > ---
> >  drivers/counter/counter-chrdev.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/counter/counter-chrdev.c b/drivers/counter/counter-chrdev.c
> > index b7c62f957a6a8..69d340be9c93f 100644
> > --- a/drivers/counter/counter-chrdev.c
> > +++ b/drivers/counter/counter-chrdev.c
> > @@ -477,6 +477,8 @@ static int counter_get_data(struct counter_device *const counter,
> >  		case COUNTER_SCOPE_COUNT:
> >  			ret = comp->count_u8_read(counter, parent, &value_u8);
> >  			break;
> > +		default:
> > +			return -EINVAL;
> >  		}
> >  		*value = value_u8;
> >  		return ret;
> > @@ -496,6 +498,8 @@ static int counter_get_data(struct counter_device *const counter,
> >  		case COUNTER_SCOPE_COUNT:
> >  			ret = comp->count_u32_read(counter, parent, &value_u32);
> >  			break;
> > +		default:
> > +			return -EINVAL;
> >  		}
> >  		*value = value_u32;
> >  		return ret;
> 

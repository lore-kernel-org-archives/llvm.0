Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964021CF29E
	for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 19:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728675165; cv=none; b=GwMLB7tIVkOJLRzxDrpdmXM5hKHqCzydyAAKmi1W82t+fWTj3M1wIxzIKba7XpIg+B9SPleFzW1oad+kr6shRDbjfQULUdI9WTz76bEiBcDCQ30JICpLQeuSpj7N9LfD6tx/TixsjqdXPdbY8Mn5zUny3Izgk2pmyNwNONAZg8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728675165; c=relaxed/simple;
	bh=jTufO1eqHWvYONgG76j5xyUnwjzmD+Ejxhm+AhPj+AM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s9SD4yQsaNqvYK4jsrcQBbH2bT7iSOOTIq+vHPQuhyU5AuacrW+CHMuj3fYTKTFh5m13GtaBaFpnBMBYnikO5NMzYIliGd2p7JV1WDdDx7rfY4h+G0zS9s6U6QcxaKYXgseXEt3k/QMhcTOEuKBZ33z6ytrqOo0xJWXEpD3NWpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0IrUw9Z; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0IrUw9Z"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d495d217bso1913118f8f.0
        for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 12:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728675162; x=1729279962; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+HS0NAdsOUYeGI7mRERtfLDO2iH3xgiX9etHXZcQn9A=;
        b=c0IrUw9ZX+QMLG+1ZZGzuiticZTvCvCFVcI6fAuWtgCK6Dn86XnosocjUhSZMVO94S
         VyMf96PGhsr/gEhjKgrf9TTbVmYY2qQ4gPeCwBmkqSqpQYTZ2ViXLf30h5Hu19vC1AuV
         Qwqi4/XBhybR3cYpbr8577p3NXgE9ddr/A6IbzkM60CZmEggYZ13wH3If8lPNT/XbdNj
         Bri9Z/ycIy70bEmGBPkig6atQzvR8d4vW61HZaRI3Y3lo8f+tGw710gMYL1jkuOjN/7K
         walZ9lA+Wv5EexEHHGw29lPyPp+ulLXYnnseOM+B/14Ncstu2W/GZBL9AIsOvbllUNfA
         K/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728675162; x=1729279962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HS0NAdsOUYeGI7mRERtfLDO2iH3xgiX9etHXZcQn9A=;
        b=FxhqkSZ0DUCjlQTznQpJQ6gulpyccMHLuQPUcUcgu2EwgQwJwCcMldeRiH+rqaV6vS
         WmdfulZ4AOu5v4SogR7Y4psPHKojbHotjSNu2WdKc/8RfVzVLlLmHjbEE455gFrJUDuq
         T0vwQyMUm431AS+bl0L8tjIlYZR/i4ENCPWbl3h+6QOmL1ZxU7FO4VgkC4WDwqBWH9XL
         cds1DVaCZCquZ5Vgg45lehr7vrt0MXTr86+z9y6GQvkO/jfSKqRiY5vVo4BP6bFrPWV+
         Nmz8599EMe745ItG31SCk2tZU7YaQ7kgdnGW27ck9WuQfQ6qPrB9EtHyNQXumAeAvoK9
         AGVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUXljtOM9vm2R5FdoHRGOe5CQ/dNcEba8ISCArvdrIWBC0lzcZ6CpheVxhyfWDXUNIiFrN@lists.linux.dev
X-Gm-Message-State: AOJu0YzcJ7JTmrQbvrr5Y//L5YP1SV/Qv4x5NVn0ZRiQ4F5gVcjjypQ2
	vRBHfY4nhORa4xnNTjRgMWuIVG3wxkUVr4mFlBwvy/AJNyjzkFUC
X-Google-Smtp-Source: AGHT+IF9+FsG+E30CjlRvWbpTNN1lU2HNefQEhmynyvChYP7LCMUBll81Ko+v5AnAFFcNs3NnrwZbQ==
X-Received: by 2002:a5d:62d2:0:b0:37c:d1c6:7e45 with SMTP id ffacd0b85a97d-37d600d2f59mr572270f8f.40.1728675161754;
        Fri, 11 Oct 2024 12:32:41 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:55c0:165d:e76c:a019? (2a02-8389-41cf-e200-55c0-165d-e76c-a019.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:55c0:165d:e76c:a019])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6b8d13sm4601028f8f.25.2024.10.11.12.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 12:32:41 -0700 (PDT)
Message-ID: <0ec5fd64-a172-4054-a2ef-1c12db41beb5@gmail.com>
Date: Fri, 11 Oct 2024 21:32:38 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iio: Fix uninitialized variable
To: Vasileios Aoiridis <vassilisamir@gmail.com>
Cc: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, ricardo@marliere.net,
 skhan@linuxfoundation.org, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Adam Rizkalla
 <ajarizzo@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20241011093752.30685-1-0xff07@gmail.com>
 <20241011115334.367736-1-0xff07@gmail.com>
 <26f2e35e-0a07-4b24-91a2-a48d4bc5dadc@gmail.com>
 <ZwlvJCxdiRqRWu6Z@vamoirid-laptop>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <ZwlvJCxdiRqRWu6Z@vamoirid-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

...

> 
> Hi everyone!
> 
> So if you check also the conversations that we had here [1] and in the
> previous versions, indeed the idea behind the offset is to use it as an
> self-explanatory index to a char buffer that holds in fact s32 variables.
> 
> The data->buf here holds the values that have just been read from the
> sensor. If you check on the channel specification of this sensor,
> you will see ".realbits = 24" in both values that the sensor returns so
> hence the value 3.
> 

So you are using 3 = 24 bits, but s32 not as 4 bytes? the whole thing
would have turned into sensor_data[0], sensor_data[4], and no variables
implied, correct? But I am discussing too much for something that in the
end is more or less the same, I am fine with this proposal.

> I am not sure if it makes sense to use a macro here for each one of the
> 3's that are going to be used only one time each and in order to be more
> "consistent". But I might have a wrong view on this one so feel free to
> correct me!
> 
> For the initialization of the offset indeed, it was already mentioned
> here [2] this morning, but on a different patch!!! I couldn't get this
> error though with gcc...
> 
> Cheers,
> Vasilis
> 

At least for the things I do in the kernel, clang catches more issues
than gcc. Sometimes even gcc will not complain, and clang will fail to
compile (e.g. a goto before a cleanup attribute).

And if you run smatch before sending the series, you might discover a
couple of extra "surprises".

Best regards,
Javier Carrasco

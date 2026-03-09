Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C7D38F255
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 16:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773073975; cv=none; b=ZG53u83ZMhc/Kt1CuTljaaKdEPzAeLe9jpt+I7g6mM0TltdpAGgrjgWJb3kRfftu2r2X7zQHXPlHNbOgAwbwhP1wPPiBTT2owbxW7yPySN0yWqBbZEH1ntPuMwY0APRBl9XEoFuvt/g0V3uKUJGNFV8m8KrGsvuTAboZG/cfATE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773073975; c=relaxed/simple;
	bh=rJPiuKTGg8r5wm3C1oCiLB+xUeCFsrM0/xa01u2CYkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TbiKikDS1uYcW1BOeTfCFdCmU24GKNOJCVsJN9lZBQj6bx8M2OKlf8Tm70YBuJNVz0eiKVILYJ2o6zP7CV0yJ4GyJYLHCyKn+tSzaiOSnCFn19u/vhGRc7Ftdw48hTew+JFoxHvPBbdRXDhaAvMbWcE8iv5ygUABUw/P8jPv/u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCfy1gS5; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCfy1gS5"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2aae4816912so78309905ad.2
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 09:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773073973; x=1773678773; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEUjR6uOStFxoT8n1is1K4BrRkwLp3/TRT3caJSkOno=;
        b=QCfy1gS59kHzR58v2wTujsCkNE6UfwwYhV1fy8Jpb3E/Zi5bmcLgg2s1Df9sCUt5Xi
         gUOloLyTSvoBjfXFvT5ZmzRKz5yObp/Y15I0UuuDQeuw3yZlM7qrALhzKpTTIKeMFr8G
         Yh7rJht+9+FGocfYv02maGDjT2ayvT5NZyJ3Yb2pD2ikbwwpsvFy9jgMgU0uiQiHp9qI
         rVdKbtHYKlvsNZIk9jexrzXF7AlDHV1u/jPlVFWN92PaZ2yMDKRQ+9+hjxChGvtY60NZ
         eAs4SEDR7oAEpt7fZexFEATsIzoQeBM5OF0Q//NR4u5OngwFj55XFI2Df65aL40L1DyK
         BHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073973; x=1773678773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gEUjR6uOStFxoT8n1is1K4BrRkwLp3/TRT3caJSkOno=;
        b=pH71xOwZn7JfzKFJJbLjLOsazDsD5Ju9SPRh6aZUHzVS/EelKJj14aLpvX9oUKNnPv
         I/RfQPb6hjj3H6YnQWvC5DOOSdhy3FSuAyam39ZRCpJHnE+Yf42OTkHLdExAqMWwqXf6
         MPKW2QGL4R3UavAHVtFaXs/GFrNm4EBZa9XZGL75lfozku6bh5XVnRuaONd86dKMrt65
         uEh6/JHziuaw802or4GhzbPjXdNC2U9pKcGrGYN854vl0+dyxn7ItD13nCD3dyMiLWV8
         S76Z15ggFLeeJvl6lYk1BovJrQmPMUdu4+c/z1wz9zNB2J25T4eiUnI1gR2sESDP64Ch
         xyOA==
X-Forwarded-Encrypted: i=1; AJvYcCVShIMqjnR6xPyAeK4zTiMMwf1munhKEpF5EBYITw9ucDPzjS6ztGUjRnETePSOIy6QGLhu@lists.linux.dev
X-Gm-Message-State: AOJu0YyfrgV0jekR4LFjSlTaXtD50OxsaNWwlU0pmz+E+/mhmenLQKkN
	8s02z8JKXaXHCOB3DS/KuC0C4t92c4iRrckttk4NZVwjPdfjwG4I1+5D
X-Gm-Gg: ATEYQzwXqrKQnCwNp0BAeHfgAmkxL18AYRNMvQxWteZuTHMu5KtrE4thF9ZMAL7w3cP
	uPrc6EFwxHN7kuK/nb9s3p6URYaw/Is1Gpy3s32KeEgLx4ReAjnuELt7/8ETZ3V7IqXTGO3L5C5
	o5Xgk9uiGea8EsnaNfFYI8lOtl8QnXBcmOThLLq9BcIdTsH/gf5DUDuM3ic34lFPRgC2rsHxx7G
	Vq0jyjczsNHnOysbrpxUXSR53BDYIBFUIrJHHx1vdu4Mo4V7FjFXK9KBske91fQagpa1lrv9ZH/
	+0YmWXQqyo7kPlqwBEq91BuScOIV8y3dD/inibrl5G4cWX6ZVld0nLdpYh7M74oKYzd78+ah3z/
	EbC5vaCHyX7V6So1I9a6wh9T6xXtOnMZvalsZ8BwwffIiQAMEbyPhoQ2e+w20wcHYhjHnIOTSEp
	ENuJgNNKC3f96rnLJjfuKIFnTyiWAmsBhsY24bD8M23/hC4ORsbNDEyHxV8g==
X-Received: by 2002:a17:902:f68f:b0:2ae:5671:7067 with SMTP id d9443c01a7336-2ae823a836bmr108455925ad.23.1773073972856;
        Mon, 09 Mar 2026 09:32:52 -0700 (PDT)
Received: from [10.79.58.83] (wf121-083.ust.hk. [175.159.121.83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9b9c6sm137164595ad.29.2026.03.09.09.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 09:32:51 -0700 (PDT)
Message-ID: <13926087-127d-423e-a4d6-55b8aabb32ce@gmail.com>
Date: Tue, 10 Mar 2026 00:32:48 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/docs/checktransupdate.py: add support for scanning
 directory
To: Jonathan Corbet <corbet@lwn.net>, Dongliang Mu <dzm91@hust.edu.cn>,
 Yanteng Si <si.yanteng@linux.dev>, Alex Shi <alexs@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260308111314.27333-1-tttturtleruss@gmail.com>
 <87zf4hvvep.fsf@trenco.lwn.net>
From: Haoyang Liu <tttturtleruss@gmail.com>
In-Reply-To: <87zf4hvvep.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/10/2026 12:07 AM, Jonathan Corbet wrote:
> Haoyang LIU <tttturtleruss@gmail.com> writes:
>
>> Origin script can only accept a file as parameter, this commit enables
>> it to scan a directory.
>>
>> Usage example:
>> ./scripts/checktransupdate.py Documentation/translations/zh_CN/dev-tools
> I've applied this, with one tweak:
>
>> +    else:
>> +        # check if the files are directories or files
>> +        new_files = []
>> +        for file in files:
>> +            if os.path.isfile(file):
>> +                new_files.append(file)
>> +            elif os.path.isdir(file):
>> +                # for directories, list all files in the directory and its subfolders
>> +                new_files.extend(list_files_with_excluding_folders(
>> +                    file, [], "rst"))
> There's no reason to break that line there, so I took the liberty of
> joining it back together.

Dear Jon,

Thanks for pointing it out, I didn't notice when I make this change, and 
I'm sorry for that.

Sincerely,
Haoyang

>
>
> Thanks,
>
> jon

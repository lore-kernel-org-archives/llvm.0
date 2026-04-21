Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E5237DEB4
	for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 19:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776799292; cv=pass; b=LmzbQfq6AVNKSd6JdIAgb/24QFp3GxTVI2I8TZVUC+8xIVQqiJ4j43m5WWVWEKgFCHVXSnCfPRCvx1ju00GxlvkfUBlP1e2YIY78N+kiKPUDz5EoVgSGe0kq9837UTCb9jLIL5Rcl4wDfy4MvugCUaeBPHTfQTeXYo2m8VoYpnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776799292; c=relaxed/simple;
	bh=RYq8M+nRYFkECwO853FXqlq4c0eXsqWkPo4rwxIsPAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvp6Of6dfCMT0QxxjdiNUNr7TNVQ/PGL02/5KkFDGphgVihrR/7Dd8P+4Ipnfv+jBUndO/MttLQP4j5MsE1SXi1coDmhKlmuFiU7NMEn4Sr1hXVw7piN5FE8ve/wzJs1CbHWqgDGwHkwhVPviQmsBHJSPitIM1/u9ol5fD0Uj9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A+vkr7w6; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A+vkr7w6"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12db63c6df4so1039406c88.1
        for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 12:21:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776799290; cv=none;
        d=google.com; s=arc-20240605;
        b=MMGtLXelSHlRXK3g7XxF/kjkwb+ZQzsJ5bpfpF4ifL8HII42T+dxVTTRlAiRKYyDgj
         ULh9aZNNOhLuLi+KRNZo3E3ib8SpdiAUgjTupdJ9I0wiD9g+8IT7FNwSOGdus273cXY3
         8ueNC3WhHqZwyYT/IbluD0QJ5N6t5ACL7noh5JydZZfSa8BpyQAcbZYx0z279V/aXA6J
         WeuKC5zZJBHuW6amjr80+i77OrAtaFpAUVibsnwXa4dK7YeI5djLYvgeK6lqBcTB49Kw
         bJMatXnn8KvYAKZy/dtyBiyaUHyTFQxKnzf/ikVrVMqC8ml8ydfVy25iROVKSxh4eZfR
         tzIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RYq8M+nRYFkECwO853FXqlq4c0eXsqWkPo4rwxIsPAo=;
        fh=pGFGTbrM37A5fseXEzO+atty3AT91/sbjQYMBPs8XuM=;
        b=ecA9nAgi4eY8JJcQZqEjKQEEWodJC7sW87QWWMF5Ee2IJ2RWiIGheWLEtcPQ1J80nC
         4EL10hk5r4WdIR8Fs+bs0KS6edei91ajxWT3rOYHVWesaDNy8SmsItR3OnQDI6Putd4k
         fk+bYDaBEJ/etYm+qN7dDwOVUhAl4JhnDoW/ybpCx5k6jUK9QqB0jdWNTaFYnDwacYM/
         QRBWojqGkJ1YaiPW4mnRjO6jJ/vOmRlbgK/EVJqgv8kf1LbiRkQcX75PYBPwtSFnK0Vr
         ZaJndbs/2ECovNWbAmgh9IwlOuxEt8jiq58DYW5zzko+q7ECZqhSQRgkyjOpeovTeJji
         w9Eg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776799290; x=1777404090; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYq8M+nRYFkECwO853FXqlq4c0eXsqWkPo4rwxIsPAo=;
        b=A+vkr7w6N8eq6m6naKkDoAYQL8iH2faiMT08usx+uqQMXZMz+oroZso7lqfBAeASDZ
         PGMlbBPxH7+NsUdyDLjwQB8+cFB3kLdYUwg9Qbd1KnsF/MfzRBih3C0F80R7g/KuM2uw
         ZBDH1Cmi0H9Or9LMuCo3vwnVYVIUh+0U0vvIRw1Ji+N9G/JUMQExIoGh96GlOKP/6Mh8
         wiXUDt8ERCOuPFygsdsAFvCsxHhVP3vFE3w9FO4VcE17Sx4VJZm0+rLxfXuYHItP3M6q
         nWEfF2OTmxq0mT5/RBuoWlKzAFza14ca41YIJorKnoYbVDZgEK6XSvApeBcWYR2BAqYt
         RnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776799290; x=1777404090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RYq8M+nRYFkECwO853FXqlq4c0eXsqWkPo4rwxIsPAo=;
        b=r5n2vcgAbB+q6d0M16gIMf9TsigZEKMTIPKMTWvYU9EAUPFp3OG82AqG8Omw7Gsfqa
         jkxiFxs5i1pfYJ+ZCPDn5RNexPz/42VwCYebQb0/pje+J7j0BXKlAMB7iKzRaFUtbezK
         V7MBZlUJkxuYfDJkK5Yd2aZeqWDus9I7bdy9lzaaWio/0kGCBYkGmFDf1ZWE6ZwJpZxo
         ONxap48fREbdu33oSm/Ijlh0yQoQI2ZE80dO31gjzrujif+p4TB6nlC3q434b12JMrbb
         PBYT0e+WvVDvkVf/fiUhhswKFtZ9rMRHLX/Ewuu7MN/dtT4VyPSkKn5QttzwLiIDanY8
         5I5g==
X-Forwarded-Encrypted: i=1; AFNElJ846jDi70CDAIeFhyH19w/GaBYtyilqHYjsdzy90SUbqOXGgscteJC8H8Ux8OAJzcnlH3Of@lists.linux.dev
X-Gm-Message-State: AOJu0YwE2/LXG2P9T7WwlTmpIc/kq2RRIAdZh0tFiJasI0fOEPLZh1dK
	uKXv78/ROx5UgFEkEzJBssRNNypxIZJFkLdvZLJF8+5sp/Z2bKnWnBjKpAU+wu1fOgEdnTzpeS8
	t/qoY5e2e3UrwYTo7rXwbiCV8EOoweF/X9PeyL+WX
X-Gm-Gg: AeBDietqEngTGsLp+hoqF6aPrcJBXJjec8BFd6S3y05QKQOMWMqL+7k7IprhtqJJRTZ
	t7elbfW2qG7rFanZ2duMDNIhtvLUrn0fhTVm8pEOWAAkIEKPS7O70hRvHF3RCBkrzKV48ynzI4U
	dY9B/S4NgqvCMMkfMN7e2ie3o5a69di0o9Y0Mn2ipKrzmtJTu5+DAgHHEmYOuse6ueq7VSFLtqP
	2UJlHzk3wmYSZPoeywE9k5fcBQHpPd9E6mwohKQZcQ1CdLp4Jko4dmFiKp+WEPdQSglaoFW8j1u
	corEP8lWPBK0RdbuyKw6EPtuX+u3VHofMoLvP3le6zUvJJqnSTTOfrMO6Wn5
X-Received: by 2002:a05:7022:238e:b0:12d:b337:8707 with SMTP id
 a92af1059eb24-12db3378974mr2023688c88.4.1776799289449; Tue, 21 Apr 2026
 12:21:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260421190351.1976329-1-elver@google.com> <CANiq72=45YiMnJiX-73gc7Y6tVTs3fzmVDQ4WdRBQcgqesYFAw@mail.gmail.com>
In-Reply-To: <CANiq72=45YiMnJiX-73gc7Y6tVTs3fzmVDQ4WdRBQcgqesYFAw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 21 Apr 2026 21:20:53 +0200
X-Gm-Features: AQROBzC0kZ36C9ivK5EpYY6pElkap7sxdoy2HOry8XvQ1HLsusvKkTXNoCW6HEc
Message-ID: <CANpmjNPiyXdQnEXw=YbCrj4R5+8CvzNPX+C4gNaqW0Kjj2-k5A@mail.gmail.com>
Subject: Re: [PATCH 1/2] Compiler Attributes: Add __access macro
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Apr 2026 at 21:15, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Apr 21, 2026 at 9:04=E2=80=AFPM Marco Elver <elver@google.com> wr=
ote:
> >
> > Add support for the `__access__` attribute, which is supported since gc=
c
> > >=3D 11 but not currently supported by clang.
>
> > + * Optional: only supported since gcc >=3D 11
>
> From a quick try in Compiler Explorer, it seems GCC recognizes it
> starting with GCC 10 rather than 11. It also seems to be in the docs.
> Is there a reason for the 11?

Oh, will fix. In the original report by Arnd we somehow concluded it
was 11, but I guess I should double check such things. :-)

> Apart from that, the addition looks OK:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

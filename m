Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5583FE64A
	for <llvm@lists.linux.dev>; Sun,  4 Oct 2026 18:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791140210; cv=none; b=YBuV6GNXZj8DWhZoK195j7rm1PuchdhRSg2fFBlmj2Oz3sCF36epey8zFNmr/8a6VTL4RuSo6OP5NjlOuS+/8k0qp8Q4Kf3Ue4r+5iKnxiib7Zk+AZIJQJOZHrbjCWnlpye5RyGIPghOTzjpqtedPeQIaXrU8VhqNwxaFTvIKgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791140210; c=relaxed/simple;
	bh=VTj3CjFmC5z/dk0JCaA0IK0lT5Ac/9t7urJwAwDbeYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRJPBQzV+9SdSclSgHXM1lkRd4c2URnRXrgRuDDQHIJm5IE8+hAEHQV0awsVxszUOfNhrHavxFOb8ggAojPo+ivfSdsIIVrEIMBf3l6m83l8l1BGsaW/cSXX+qIOticJhZmJkjUmENwahplqqG2WFjmuAPkzqJ4exm3MgCONPBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvzlOw83; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvzlOw83"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a024e16179so6050285e9.2
        for <llvm@lists.linux.dev>; Sun, 04 Oct 2026 11:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791140207; x=1791745007; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yLp7Ndo/7k4Ng8+ohcODGZItHn+YB7X4XQ/xgVicdsE=;
        b=gvzlOw83hmohOcx0Mun7BJ+9lSS9hBRJNvWygkAeMRDmcVKDya1Ms8wZx8/Ov3AwSu
         dLnwNq++yW0eVIae4VAo05UFRcjXUe9R7YtWw00afKHqJJSXIhSXv3Bbq1Vg2mLChYOt
         rNy/faHtJ4ThCszhi7UMau7K18p/+HbEHVeo/SrdS/4l3OxlXBhMjsrXnyvu+jQfD/ZX
         HTuhZDjHKTibMksHOSWYBc8xoG/tW9aDUIv/ZS0Jhl9acLRgaktE8HsIymchiJ0o54yb
         kRw1UQEH/0uxBrAilTH+8V8VrWmVua7Je4T8tAXvEZuRzn6chQJqrhWaU7fTQff9+7h/
         rwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791140207; x=1791745007;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yLp7Ndo/7k4Ng8+ohcODGZItHn+YB7X4XQ/xgVicdsE=;
        b=s1qZ3iXukPjYkBdmcIYb0Xycq9XxzDDYAAbfARwnbWqC9swlgA0fExuecgpXrXrFnf
         Z5HUXWt+X7aNukbLyUlo1C5ntDmW4q2K8a1T0/GL0h4ftlWLBcPzqNihpJrhvCtEHmfW
         JhGKryj4hh/S2DHrwBGL0wMI1jhD5MWaB5GjbupF+LbebYrUgAzqXKxBOcPJmYpgk+ox
         Sx7SI2cvgMdlQDlWQg/j74myyQs3hBYB0HGPTmjVQFsbkjDwWWjbJ9Ru/WytEVL8HZfW
         F1hPGTjqWDaQFAtXmMj6/0hl7j80wPWNJ7vDoz8qCpLIAyZ7lC8786UrgHk7AITS3E9f
         t/Zg==
X-Forwarded-Encrypted: i=1; AKwUvBw7xDwhX828anKYeQfSylOmEOY0uBEXGbGiP/f/WMWWhDoceBrgVXOzQA+rN8drqxAvzNQo@lists.linux.dev
X-Gm-Message-State: AFuF++kOKvD6uouSAZSQI9Rw/69ovNzKKbRhcKNsgd+pYfEABoPv9ZqF
	lvWz9Fwz8Vh5lWMXMX/WwIdxiz4V9AOnuUd3zVrHcDEr8CRvPibclFk2
X-Gm-Gg: AYBFou2Ekr1++nDBw1oGjJ6dVy5Wcg6oEi71LaSgtmnrnkhE85c9HhMoMZbEjiTTPw4
	dHxWiBXo1d/GaBFoXJfPgKbz0zeVyExV9LlmG1VScVybARr6NdY/Zkts6jNLp7yY41uIDW2uZPk
	MVJDWAy1rsG2RiMxgmz5GRrj2ssmQRMdYvWMRxldmgQH/DttUtImSHOHFzu1lHACA1DXoVU0J4j
	rjqfH0ZGomTv27mAeMVPeHtbfseNrwbC8Y9ZTU/rKXoHGxrG7RtWaxIibJi9UXGvI/FsHjQ/gMc
	zqYqyDXjA7E35kLKxOBDwVQz0HSpfwPc8ZJ8sssHZn5DZOzDSUiESvL2MlhOjhbL3ScgFoFH2Mo
	teFku0/yeNlh9QpQJg97pYiahYyR6NWof3a4Jx1kCvcQbvreKdoI29H1WFmzjaM5Y10AHoNEAZd
	7CuVfFQXam9GZlMpw+/ye4fXtbSjgEWKbyoUBjSJTaIUVsdyD/IckJkIKoP+rk+pdOs3+Wwf5dc
	uofrJZFBycjacYclhlYQa6NkSPSOFvy9eZg67PaiOS76t1ircf11hMHTvC9TgiUuHlo5lrsdulc
	+xByzenfWnoTFJsDnFP7iLNWRacsqz1BOkeIIf70gi4YzdJRFi5JeonOLhJo1EgpzB2afUWANsH
	nniOTD2o=
X-Received: by 2002:a05:600c:6212:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-4a02758405cmr139001325e9.19.1791140206606;
        Sun, 04 Oct 2026 11:56:46 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-a190-7401-a90c-9d77-a1b8-e6a2.310.pool.telefonica.de. [2a02:3100:a190:7401:a90c:9d77:a1b8:e6a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm318633385e9.6.2026.10.04.11.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 11:56:46 -0700 (PDT)
Date: Sun, 4 Oct 2026 20:56:43 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, 
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Bradley Morgan <brads@mainlining.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: rust: Enable Rust support for ARMv5TE
Message-ID: <asKgtWX7q-mgvnOc@gmail.com>
References: <20261003093827.77857-1-kmehltretter@gmail.com>
 <20261003093827.77857-3-kmehltretter@gmail.com>
 <CANiq72kGay03jqFOfFcJOjr9Poy+yc2u0=Ep_9LQ+KMy=1JtRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kGay03jqFOfFcJOjr9Poy+yc2u0=Ep_9LQ+KMy=1JtRQ@mail.gmail.com>

On Sat, Oct 03, 2026 at 12:24:35PM +0100, Miguel Ojeda wrote:
> On Sat, Oct 3, 2026 at 11:38 AM Karl Mehltretter <kmehltretter@gmail.com> wrote:
> >
> > Tested on v7.3-rc1 with clang 22.1.8, rustc 1.99.0 and bindgen 0.73.2
> 
> Great to see more arch support! Just to confirm, are there any
> toolchain requirements to be aware of?
> 
> If yes, then we should add them to Kconfig, `scripts/min-tool-version.sh` etc.
> 
> If not, then please test with the minimum versions too! :)
> 

Thanks for suggesting that! No extra requirements as far as I can tell.
I now also test with the minimum versions (LLVM 17.0.1 and gcc 8.1.0,
with rustc 1.85.0 and bindgen 0.71.1).

So far I found one small issue with gcc 8.1.0. A fix for that will be in
the v2 series.

Karl

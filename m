Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503C429CA
	for <llvm@lists.linux.dev>; Tue, 18 Jan 2022 07:30:20 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id v2so8686719ply.11
        for <llvm@lists.linux.dev>; Mon, 17 Jan 2022 23:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:content-transfer-encoding:mime-version:subject:message-id:date
         :to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=VstKoCnwqZAYAMNGCxmxR1gGgzZsXsyiHK2e+EtghSx4MZKmEf0VQu8tvGD2Jpgjjm
         NmksLEfmUbP70IFD6QHy+yaLL9HrO7+hRtSzimcnCsIPm90XysnW02Mz2EzBrvxkj2eO
         ihBSV3uZTgKSzeDw4bs1tTTwgujusGLbAqIeYijANATrg11NZExVhDHqWEwb4njW7RAA
         0ZwBl/RbgdhmLldcBcEU/VGIexlGsyE9jwMVpH2RPyi+2f5tdVP7ttTxJOTM4UCYtyRP
         F+diTWmF1CFmjk3er+NRJ2s5Ww2KkLMpLT47OSm8OCGJ7BJfRSxxbCVl6UvGKyyKk9J0
         GZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:message-id:date:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=XcpZ2eGnhSsLaIcU6J8x+3rFxsQdYpSmX5HGgHQe1pbNiPo7EM+kpqlbg3FZDDobs9
         GHgdQY6zgBMghaj9qk6YeAz61XNbmOeuBtgWcoojf8NgiiwN0b8J32it0kpvR4pgt7zB
         dj6CBD0f/7Lq3qvgA8I0k8KtyiWEpJNR/tJ8srnG+QK+JeU11jflJLM2EPh+gqUJOekx
         Y5hq2u4hTrXTU1baWdY5QjWabZn2JQSBV7I36++aUHjJ/ORv+mqm5M0gbIxPZaS7Ukb5
         leuYRHWXxoAFuyc1JuSoBfjvyUPXdF3ekkO9q1qM9lNXdVNLwEreeUMBo6UhBhcdO0yo
         s/sg==
X-Gm-Message-State: AOAM531yoFe4NPag+YI0jmWiCE3WcyopjUIoIY+t0czwawcSKBAW/f6f
	bYrPUgS+6nHgwfh10pDRXYHej2678a0=
X-Google-Smtp-Source: ABdhPJw9fVja9fCfWgnWyYAu7TB+Pi/7pRSgfvqA7lgo3FzSqqbKerjd1z7MkWHUCzRJTEB2zuUQkA==
X-Received: by 2002:a17:902:e74a:b0:14a:3b22:5ca5 with SMTP id p10-20020a170902e74a00b0014a3b225ca5mr26194884plf.96.1642491019653;
        Mon, 17 Jan 2022 23:30:19 -0800 (PST)
Received: from smtpclient.apple (14-200-39-151.static.tpgi.com.au. [14.200.39.151])
        by smtp.gmail.com with ESMTPSA id h5sm14042471pgv.40.2022.01.17.23.30.18
        for <llvm@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jan 2022 23:30:19 -0800 (PST)
From: Sam Zeter <samuelzeter@gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: 
Message-Id: <D8375746-BA8D-48ED-B60D-FB9C61835A0A@gmail.com>
Date: Tue, 18 Jan 2022 17:30:15 +1000
To: llvm@lists.linux.dev
X-Mailer: Apple Mail (2.3693.40.0.1.81)


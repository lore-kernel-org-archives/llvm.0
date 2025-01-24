Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDFC1DC98D
	for <llvm@lists.linux.dev>; Fri, 24 Jan 2025 21:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737753790; cv=none; b=lgY9WbPXJu/uetTmp4yc2RSlkrNHun5pUB0ie74Ph8n+F5xlb6JAVLDuVmkVO2NEp6r9ZhkAGnDOTvCQkg/eJtTG28+ES3vajhpi1kh/wwPdU+a3N9TY6LYJSxw5zIBHWfjEeQoBErT8mLTenOZem5eKcqE5wINoCRXOiAU2Nfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737753790; c=relaxed/simple;
	bh=0vbCAH6peRmyF5Dq3lERxI4cWpPTtTI5QtwDxhz+Yts=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=TJZBi3KJhMGNCBL9T2Hn0/73NB4ZCvnF6eXunGPzEDSX0D+TuVUx4gl1sbCl0A/0MEMCdU2i2hS+cZ7Sz5DZYIh3AtZF6tYs+WuRzg1/i3O6s8lfsxYFI/Q1z4A0TNkI8pii0/ftjMvPHtV/NWotO88V8XwGb2k106/OlUs7gOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O00W6jUG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O00W6jUG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737753787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=avpIsHB/SNeoh3i0X5ivmT3kw1j9sf4L1FZUgyMseLA=;
	b=O00W6jUGtDXENavyNvrhAEhhzlbTxAHz7xyHsCJyX02i7oxAMFmJN5GL3ATkRS6Hkk6kAR
	uDpVloy0NiV/G5ufUO7t1Gy9nM9jnMt807ZdJimzG5Alr46xpNYVO1Kbz7i7UuN9D4jI2n
	ZvoEEM0uCGckVjZU7rnwhDYb797WSCs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-bRxIBVb_MsiE4OTJjOettg-1; Fri,
 24 Jan 2025 16:23:06 -0500
X-MC-Unique: bRxIBVb_MsiE4OTJjOettg-1
X-Mimecast-MFC-AGG-ID: bRxIBVb_MsiE4OTJjOettg
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 31A2719560AF
	for <llvm@lists.linux.dev>; Fri, 24 Jan 2025 21:23:05 +0000 (UTC)
Received: from [172.64.13.55] (unknown [10.30.32.164])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A1027195608E;
	Fri, 24 Jan 2025 21:23:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, 47d65738)
Date: Fri, 24 Jan 2025 21:23:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <93437.125012416230600829@us-mta-682.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O_dkVCD1j0GUGCJ1jNxHGMuKe3Z07XXPwWb-MaJeyu4_1737753785
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'parisc-for-6.14-rc1' of git://git.kernel.org=
/pub/scm/linux/kernel/git/deller/parisc-linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1640239740

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1640239740-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1640239740-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1640239740-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE3ABE71
	for <llvm@lists.linux.dev>; Sun, 11 Aug 2024 18:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723400528; cv=none; b=Zd/sk+KzawMHInKgK8WBOCuEIADm+GhlbRKhdjH4OkK94lgzxTkUmSYTZEh04IDLdSPsVfc9xxISiakKF0rmqEyre4lrb8EaRTFtp2jlMIah1cW469VVJVsrCx/qFMo497EDPWKEJb64SnxX2VfBeoLwEArHhc500kypkYcfBss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723400528; c=relaxed/simple;
	bh=VUgmLu5fxeGeWdzwq/L+WE2RYQoYipTvtWCUaqiNvPk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ENT0vBDCkFYbPnEF3gkKV8FaUDfSxjGo7OOEFAkwMH6WV7+q43cUxDo44y3L2XsuWRwT1myDX2c3EjQlxRs/irEIp8JDL0uPaJ8avdSB5zK5IMgFIm90FwV0j9U8o+XRrdAKBOCA6DTda78Oe6187GMAkYHbmGntZMdTswOE2dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ge7WdBUT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ge7WdBUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723400525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cUFz5IbZyFJbOSBqRWowiqP1FmcK0/pVpQ9OMVJ5NyI=;
	b=ge7WdBUTKvFpSD9b4zRR5gv7bBqsUnG1D3jQRr46SYOBN8T+nQRt2b/eIpv6xlAd5RWgNU
	uZp910hL8nsCV25YdNQ5/lC4gWduqZJ/oYNFe+uIjMtbQYIvsvqOdjpoaLYvl8+JebbHpW
	Mmw5++mm1BI8UwVhKn3oDHs7+6pfCfM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-277-rdiEfSw-OZONL9LQnjXK2w-1; Sun,
 11 Aug 2024 14:22:04 -0400
X-MC-Unique: rdiEfSw-OZONL9LQnjXK2w-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 573071955F3D
	for <llvm@lists.linux.dev>; Sun, 11 Aug 2024 18:22:03 +0000 (UTC)
Received: from [172.64.0.80] (unknown [10.30.33.131])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 78E831955F3C;
	Sun, 11 Aug 2024 18:22:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc2,
 mainline.kernel.org-clang, cb2e5ee8)
Date: Sun, 11 Aug 2024 18:22:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <28102.124081114220400175@us-mta-277.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'usb-6.11-rc3' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/gregkh/usb

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1408963384

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1408963384-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1408963384-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1408963384-x86_64-kernel-debug


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


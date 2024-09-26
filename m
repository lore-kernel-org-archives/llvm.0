Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29245132139
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360011; cv=none; b=QlS4AdvSJd+VqP6X6pW5SbMxQWTj/m4Az6KjihiM0bHLbjY34k98oXabO4i35D1FmP2Svv4niNn69K/s3BM/C5GIlKdsZ6+ypP9AejACvOZKQi4wdO1R/gjIaE1ly6IoeNkU3f2OcGT3noH21NmvgH+jWPfSRUy2UL91VcUw+Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360011; c=relaxed/simple;
	bh=z091D4/b/CiUtyKzta/F8Nm8UfOZO8dG9FC8+OxlbJg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=C/3LUaVVL6EL/jRAhR1tiJtKXpcWWvKTLPc1Qmw/jVDYhfROP+5B8Q7sVZKi42pw23TMb9gqCuQ5sSIvEfByU5mW4JQtW6caTzvMS4iVBLxE7lMsvPoORhuWXDfsA3u9rXPaPyDxKVJfNVzRveWCoac2YYkYAOhXKtwhvgLWpjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hYVmwfpz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hYVmwfpz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZhCwU+dzT5i5PwSfoHDIIHxvYBOwR7AAtpk94UnPDXw=;
	b=hYVmwfpzlUIFtz7IZ2q2mlXa6cb9qZE9M8v2Ffvgcy5wj5+e3h6O7X0lrs64Br7/X97Cwq
	hwoytQaTSAPYG7IMFQdpVG+x4OohfamIT7GjcdcSwPegoWIpBx8zblurUDQwjvpbFC/vDo
	IQvSxvg0RCckRxjuawNwDI4Z4UAwXDs=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-390-kcyWHc_wO1Gf6pmer4tCig-1; Thu,
 26 Sep 2024 10:13:27 -0400
X-MC-Unique: kcyWHc_wO1Gf6pmer4tCig-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 041AE18F8A0F
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:13:27 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C2CEE1979060;
	Thu, 26 Sep 2024 14:13:26 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, 6db6a19f)
Date: Thu, 26 Sep 2024 14:13:26 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <53937.124092610132702637@us-mta-390.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'hwlock-v6.12' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/remoteproc/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1467603764

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1467603764-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1467603764-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1467603764-x86_64-kernel-debug


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


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620B213632B
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360913; cv=none; b=QlMK4CbA3hb9Gu91sN45TvTqo7Nkm3vC09HCz9ftJQgMPQmhqMztAMqVAAcahMB0fB/OJ7ZQTpOFuIi5giKcqAK+Dir83z1GNnNfrAhEeEghPop7ERHax/kjoJJq9EUI4AyePkz7aI3eMHEGdrd2MivGXd/f81ikfloItrQ9Koo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360913; c=relaxed/simple;
	bh=Fx7g0Vr79xrBJxLOZqSw0+NcBmIbw0oBjiFGgxzuiHc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=FQSvr/K4OmQLa7shnSTj7tv4zc5HH7iyQiimWszO7niW3VxEOKEp0sJXz4E1jxSH7cju3tyEuWVhUprUf4+8oZ92e2jup8iNjikfLlVNuYk5R+49OqJQzieaxojljBm7ZDjpOmsVGdVf5PcAx7ZYEMWe3eLaq2HjGY1UnQsAmlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E1YdMprT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E1YdMprT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qbg/yIq4bsEKi9VWn9TRtKhLWFkNcmE/HcBuO+mzqKI=;
	b=E1YdMprTXXrgzz1UO9R5H02Sk4JZavDVFVWOsJPWr/j3zbC8A4JNPZx2IADET1Wek3XV3a
	IxHC2FCiAkatagZaziwFZyb8gniK3XBXP5MgF9VSub2DGm59L/zBgyIT5BdbfNUfgM5CnC
	qpN8gyBBJFVOtsyN7O7+2/7SWnZhUXk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-199-3KU65HSZMxOtx3GMsO3A2g-1; Thu,
 26 Sep 2024 10:28:29 -0400
X-MC-Unique: 3KU65HSZMxOtx3GMsO3A2g-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 26E3E197731A
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:28:28 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AFB981954B0E;
	Thu, 26 Sep 2024 14:28:27 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc6,
 mainline.kernel.org-clang, ad618736)
Date: Thu, 26 Sep 2024 14:28:27 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <23902.124092610282900743@us-mta-199.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'platform-drivers-x86-v6.11-6' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1442064761

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1442064761-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1442064761-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1442064761-x86_64-kernel-debug


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


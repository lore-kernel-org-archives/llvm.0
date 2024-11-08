Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA7617C224
	for <llvm@lists.linux.dev>; Fri,  8 Nov 2024 00:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731025330; cv=none; b=iguzCb8GgLezzFDJORmUECy7ZhS16PRNGJ2NqvY832i1oIVXdR20lqo8koU7mRt+gZWgTuRS4Sn6rKEdnSsHRCx743xrEU1Y9oqfVe5OiXU1QEXfFqd9a2Obk3h3Pcj7e7Lylq5HxuikBtuFvqr/wssoE7YaIHJiJJYqd2bxXuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731025330; c=relaxed/simple;
	bh=ZbQGo0dLZ1h0GMm+/1ST0GxtSnxHgD5uIRxBPwslepc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=sqE18ZXHGZFFgsguEWy30RquLCUmT4069zFyC/zlCkvumFjDWVyGeF28FHjHy77Bv9AW4DFhyqWWcAmR6s/ojXU+0pvpHH7IHe8zxpycBUYRVYm8CPNqAKNN/e/hfD2dvNU0IIdvrdTRZFl0Way+r6nNNeYP2CEYoxmviXL7ilA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=apvbXPEK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="apvbXPEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731025326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HNKZoEwufM0BzXNe0q/m9A7tNMbEqT9+FwM4QOGZTEs=;
	b=apvbXPEKkJ2PJhXNa0WE3y398fwMmOxM/fdW+Ml0QRV+5fmE2Gvofs99GqkfdYnNMgc8dT
	fYLDa/h97AaRv4HjFJaqsz8miJtncX7daWZ6QvqchSPp1VPtUWRxhMJ1EKUHACQ6iD1Nu7
	OYX3sG0ZHKIRlz5/4WExCsSdyS6wUds=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-183-nIJG8_BqMqW5GeQWUuGm_w-1; Thu,
 07 Nov 2024 19:22:05 -0500
X-MC-Unique: nIJG8_BqMqW5GeQWUuGm_w-1
X-Mimecast-MFC-AGG-ID: nIJG8_BqMqW5GeQWUuGm_w
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B240A19560BD
	for <llvm@lists.linux.dev>; Fri,  8 Nov 2024 00:22:04 +0000 (UTC)
Received: from [172.64.13.23] (unknown [10.30.32.164])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5DC4E1953880;
	Fri,  8 Nov 2024 00:22:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc6,
 upstream-mainline, 906bd684)
Date: Fri, 08 Nov 2024 00:22:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <65799.124110719220500157@us-mta-183.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CSeltXZqrQVCg0MF-umQPGlx9TRbjPHtd9oQFrOIWUw_1731025324
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'spi-fix-v6.12-rc6' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/broonie/spi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1532350699

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1532350699-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1532350699-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1532350699-x86_64-kernel-debug


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


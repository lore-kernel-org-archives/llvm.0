Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF102E3FE
	for <llvm@lists.linux.dev>; Wed,  5 Jun 2024 19:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717615928; cv=none; b=U/sVvLns5lJgZGZv/72hHNzuObUQ9x4CBB9EbA+6jGO8wTGkNYboFnFbPIzjQ/8MCYvT2Y8SYd5mENkjG+3+uoS7q3MT6Vd7gDLD+OI5vuj5rSY5yQtG6w14Qb5Rp15OylNk1SO2eFATPqQSVFrH2ODDjy6fR1uAmKpvzYRyvBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717615928; c=relaxed/simple;
	bh=vo3mvxLwtQjOwaMUgeOgU6n4QXotq6XOZl3fw7Ik4pc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=HwyyDKBFm+GYVZCjpxfq03cajJzbUu5Z6zxhCJWJ1iBvx5YxDUO1I/+QSPjvDuKT210r64pUU3GRTiXwnD1w6DMLV1OVM8CmZhPpixIEvDx+WqNyXej11xgdilqigr0kgxKgz84QEsPLdWShiEmNA8RYk3hRmGYvlpGDPBTKG9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YDbZ8oTy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YDbZ8oTy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717615925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WN/6f3EMN1YzqVVNiWLvqgbHk9ML9jFFwmopwBHDnFw=;
	b=YDbZ8oTyv3fRCT1K9lxYb8fnLw/La/47+5mgGCMZzX3TD+0zynSiJ6+lwTF6OvvZv6nlbn
	keEQqB9FG/Gl03KbTP70NWNYpgCrzWHp+OJBzBIszcaDggq8nbQk6fDLZyChpG1Gk5FW9A
	Bh1Ptw0G0URviGw5MnfhADnOqUB2Z3I=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-258-VlnGSY58Pl-qOiuloWz3yQ-1; Wed,
 05 Jun 2024 15:32:04 -0400
X-MC-Unique: VlnGSY58Pl-qOiuloWz3yQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 67DF51955D66
	for <llvm@lists.linux.dev>; Wed,  5 Jun 2024 19:32:03 +0000 (UTC)
Received: from [172.64.4.49] (unknown [10.30.33.216])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9F7C91955F79;
	Wed,  5 Jun 2024 19:32:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0-rc2,
 mainline.kernel.org-clang, 19ca0d8a)
Date: Wed, 05 Jun 2024 19:32:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <20066.124060515320401127@us-mta-258.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-6.10-rc2-tag' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/kdave/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1319998309

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1319998309-aarch64-kernel
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1319998309-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1319998309-s390x-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1319998309-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1319998309-x86_64-kernel-debug


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


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EC3171B6
	for <llvm@lists.linux.dev>; Sat,  3 Aug 2024 17:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722706331; cv=none; b=ag9eKuUsUc9bySHh0rEne1/GA50HlqtJpGn6oeY/rhcub6e78YUTg1tb1RVjy7Z64/4k8Xw1scEdVL0553xkXZ1uONeII2lWX+aAdadEcCXqBpWFGuEbNYKfgGw8qhOxdNm+6iVsCpt1Qo86Gm8460QssTFwhRzUF8G+LB4Nx5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722706331; c=relaxed/simple;
	bh=baXgXZ5RBVk1yC+W7G1IFAs9YyGTlL4Yyh2SMP/+/E0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=rDffFZtC8hZlKpSgGAhthRCst2I36Wg7YGiJqSxXx9339LMnia452VNTaF1KFZrZNbgtZD4bVJsro0BE0Rz1j47qlxVtSsRmJK0hJfEND0l7JPTrqdA6ssmphKTYZygX1cb+543qixM/9qJWwWc3Yk+0O0l6BomahdaCUBgjjuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WZktoKI0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WZktoKI0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722706328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I1z6uMuR6i+USPkZHQzXIAFqiTj0YjJI5DAhAkTpExg=;
	b=WZktoKI0HDOugRVPs6zZKGjg/Dj3bnzBfG+lVgEo0UHManLcml0HE77dXNmpe6zrlZDkPm
	3fI2gMLhw/6Om3leiKgf3IYvhnkf8vtmULO2Ix4pk5y18kwr4R5pOwM1+2zvA6HEPOJj2D
	nDRbnH+pU51r5KSDKQdJih552Dd5Ou8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-90-dCANSi7ONUeQzx3w3dsO-g-1; Sat,
 03 Aug 2024 13:32:05 -0400
X-MC-Unique: dCANSi7ONUeQzx3w3dsO-g-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EEBD61955F3D
	for <llvm@lists.linux.dev>; Sat,  3 Aug 2024 17:32:04 +0000 (UTC)
Received: from [172.64.4.38] (unknown [10.30.33.216])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 40FD319560AA;
	Sat,  3 Aug 2024 17:32:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc1,
 mainline.kernel.org-clang, d3426a6e)
Date: Sat, 03 Aug 2024 17:32:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <74051.124080313320500311@us-mta-90.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'xfs-6.11-fixes-1' of git://git.kernel.org/pu=
b/scm/fs/xfs/xfs-linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1399672634

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1399672634-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1399672634-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1399672634-x86_64-kernel-debug


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


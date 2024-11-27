Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD81114A604
	for <llvm@lists.linux.dev>; Wed, 27 Nov 2024 20:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732738330; cv=none; b=NaZxVhhPdRBgPXoFLGVAFu1J7+Yhgg2k1TBvRXpgimi2D0oBglxopsoGT5Q55isjkPvZR3umbf1DkBjQTFh026Y52YWkSfNPSMAmZk0aNbZLGJBoR4FGQl5wTK+si5klyBH12CB6VPVutzjHH04mBtp+oj0pCpjJksRLER3SkUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732738330; c=relaxed/simple;
	bh=ncdhA3Db7RWjip1XxazBSrD8/gq0GiJMgqkDQKO8BSw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=lbnS4wvUUqQTu/HtgYf50v8oDKGq5J7Jb9hBwoyG7O5aF95SFIKH3b+60yBUsFIwXgu8SNL11gtAfG+RbdAxcvs5YzdLz4Fug0PL4E/UxTmQI5ogmAvWP+Qt2GDFipWZTfwUE0emo20VlPXzm7g/Hfx+8vLXeeG2B+fOGMYS9Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iko5wQqX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iko5wQqX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732738327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cUpahrTiPSSyivlInNuwqgIKcaQl6fPyrwTG3n0paqo=;
	b=iko5wQqXLyGLcIke56j12v3O+z5exOQyo79b7R4Kt6J6VhZdqmEgKJGpsQQfOo3AOvxKQG
	CBPsJYTYDuLNnWzzDE1+hEaLH+2h9lTAgoq2hoQOvFTbGJw7suazhV9WCza7fzMoaPqjTW
	kzFj8ChcUlzWqAtwS8459hYaLpbmzv8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-567-y382YUMgMNqKFDKf8acs1g-1; Wed,
 27 Nov 2024 15:12:06 -0500
X-MC-Unique: y382YUMgMNqKFDKf8acs1g-1
X-Mimecast-MFC-AGG-ID: y382YUMgMNqKFDKf8acs1g
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5070719560AF
	for <llvm@lists.linux.dev>; Wed, 27 Nov 2024 20:12:05 +0000 (UTC)
Received: from [172.64.12.14] (unknown [10.30.33.24])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AE80E19560A3;
	Wed, 27 Nov 2024 20:12:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0,
 upstream-mainline, 7d405072)
Date: Wed, 27 Nov 2024 20:12:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <85344.124112715120600341@us-mta-567.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: katvYfTn7hPKcaDIkfRdnszceVW2ORE2Jet-4r5F_N8_1732738325
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'vfs-6.13-rc1.fixes' of git://git.kernel.org/=
pub/scm/linux/kernel/git/vfs/vfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1563035772

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1563035772-ppc64le-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1563035772-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1563035772-x86_64-kernel-debug


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


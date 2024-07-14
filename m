Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438E913790F
	for <llvm@lists.linux.dev>; Sun, 14 Jul 2024 16:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720974805; cv=none; b=dqhHMeRJhWS0Y5Sj6lkKj6uhqu0Ff0bW7WfIfFTviC5QRm3KaPiOIdrfBecN1CchT2rien7Oi/84N+GZDJtNC2U5tS1Uh2gQqUh5AcJKrBL7+ywuzsROSh7zMdGnDnFXijcuU2Vgei9UBhhniK9V10lhXOGIaZ1xnbgrd1NKqRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720974805; c=relaxed/simple;
	bh=2EL5C9emBtn6tkgp1ImV+BA25cV9DKBwz+LqtcmbyHk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=N0AuQvYMDuuibK9SX8FLmfK6/BLfM0J5lc8hdIdR9EAG5KNiCzqDUKGNJCVchLSTVKBF+k6pL5ik53T5bizq0pd4mRBIMbeIbqKR6vT1f6+R6na/mHysMydQSdP+DyR9GrHbuMPYBHV1qPhcLSBbG7rDaRVfl9NNfKKxZmT1Do0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B8+ATlOZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B8+ATlOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720974802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FgYmJnFThtcKBFHpiGzKlrNejxDAThqB2q5tIpocMBg=;
	b=B8+ATlOZ/2RpgkO7AkHDHTE0ImVMabWWYEyD2vJwNJcNB4O7M+roKSWtxcBs+ZAPH8cepU
	Oo5GfKSbN53qkjT+9KyZsgznMsIZMBwlMqwCuUwFvL1P8v0S4DMGjWIxWcHPgeXA2G+cse
	WKJw0f6FDX7mtQG1ovIX8wZuqjcDPjo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-494-njvg62sRO625qSD9KPZH8w-1; Sun,
 14 Jul 2024 12:33:21 -0400
X-MC-Unique: njvg62sRO625qSD9KPZH8w-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E527E19560AA
	for <llvm@lists.linux.dev>; Sun, 14 Jul 2024 16:33:19 +0000 (UTC)
Received: from [172.64.15.30] (unknown [10.30.34.46])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6902F1955F40;
	Sun, 14 Jul 2024 16:33:19 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 12 of 192): Test report for master
 (6.10.0-rc7, mainline.kernel.org-clang, d0d0cd38)
Date: Sun, 14 Jul 2024 16:33:19 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <21325.124071412332100248@us-mta-494.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag '6.10-rc7-smb3-client-fix' of git://git.samba=
.org/sfrench/cifs-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1372629157

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:=20
    Boot test [s390x]
    CKI/restraint [s390x]
    machineinfo [s390x]
    Reboot test [s390x]
    SELinux Custom Module Setup [ppc64le, s390x]
    Storage - blktests - blk - upstream [s390x]
    Storage - blktests - nvme-tcp - upstream [s390x]
    Storage - swraid scsi_raid [s390x]
    stress: stress-ng - cpu-cache [s390x]
    stress: stress-ng - memory [s390x]


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


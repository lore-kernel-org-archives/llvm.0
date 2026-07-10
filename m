Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C39C3C4154
	for <llvm@lists.linux.dev>; Fri, 10 Jul 2026 15:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698732; cv=none; b=mJN9KH5+E81pESpXz//8GD4oKISGYuYJpWoRYCK7PFIa9CAmxIPTxt6sfKp60UGXTm/hyXX+BsMARpfZ+D4DBZiJ+GIeXmYYQ2KX79bmMMS10VEvnO6NSUlGsG+0gKyYb82spnt3fzdirDNM+bTX+twdcVR32kdLVxXsY1deao4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698732; c=relaxed/simple;
	bh=xzI7YuLXKFYrd7L8nHNnvdDrH4tXOOPD1UrJum7eyuI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=HEWSygQVAqmioZ+IoM2Ak5KJ4R+CPk1twGxeuG+Gf4gF5abL1XnWJopKplAtythz4rSBue7i4ayspIMSybFrp1RW59cIJ7kBFDnhG5ua+whxGDtgB+wD8qHdW6XbLGRh+GgPWLv6Xu0yV1g/pebgNxhSFqIf5nSf98OAkEl696s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K1pq3LrY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K1pq3LrY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783698730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=O/rVyQwwQIxRbQsN38bmPDyprWm7NaceMB06EZwY4/c=;
	b=K1pq3LrYMjy0ROkBunQzx0R9WjW3eoqwMGJtWk0mBXVSPgPaarihMdw45orndbgLpFkn+g
	eJ0LUaf7SdjK0+JssKOBMt8iFP62FJcspCp/fL4dhSd2Z3l5Q1QpecoQDlRsaqtMILDUVV
	c+6ZK61trQVCceGTcRzNLEeBZ/Htf4U=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-290-W3az4SQ3MS6yPSbFknC2Rw-1; Fri,
 10 Jul 2026 11:52:08 -0400
X-MC-Unique: W3az4SQ3MS6yPSbFknC2Rw-1
X-Mimecast-MFC-AGG-ID: W3az4SQ3MS6yPSbFknC2Rw_1783698728
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C576E1955DC4
	for <llvm@lists.linux.dev>; Fri, 10 Jul 2026 15:52:07 +0000 (UTC)
Received: from [172.20.146.15] (unknown [10.30.45.65])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4E7F11955F7B;
	Fri, 10 Jul 2026 15:52:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc2,
 upstream-mainline, 2c7c88a4)
Date: Fri, 10 Jul 2026 15:52:06 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <59010.126071011520801637@us-mta-290.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OuypT18A5PD5hs58mwSKugx4N-8F8w6Vqv4RrvkSgRw_1783698728
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'net-7.2-rc3' of git://git.kernel.org/pub/scm=
/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2665341184

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2665341184_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2665341184_x86_64_kernel_kcidb_tool_21614404_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301



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


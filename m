Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CCA1C84DE
	for <llvm@lists.linux.dev>; Sat,  4 Apr 2026 08:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775289791; cv=none; b=VLdK9IlvuGdQl3mr+cVuvpMnVXwzM/6HVCHDIREai2ifID2ucgiSciHYFd77HanVml/O0iHI/Ocng18xE9p0AO7UraVld2g7dzm7Dl2gFqc5TQgtxSZNdputusudNqteG3HL6mNuH3OwhpF6lGO1d04f9lQdB1pUH4lGRP0rUMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775289791; c=relaxed/simple;
	bh=Ad3P13mUxeFbBspPi1yZ7fiAhxCUaYsnog3ct/szQyc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=QP4ns0Rax/bqgj8r+yRpH8i0EzmLRBfk2lQItMNJyL2aFaCjvUu0QZaati0kV2PQiAlE1sH7+3/saHPS0RcK4aff5yPtnsaCTvwiNaTblo5ysMqH5SnVdCqNEVqMRpZ1h0A17icpIvhm9Z347wYSBXPZEYB3yAk4mZOAbPWhJB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cvp89HuX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cvp89HuX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775289788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VzQHYBmo3VnUCJOdom+jrrYBUOq5j5d/HmQERkmdZzQ=;
	b=Cvp89HuXBS1ADMCar+t6oVc+6IhrecURm9YBvkJwSlDYD7e76QS/ROiD7ndEXwClo77GIE
	R2yNyP8JyQnZxSwf03JDj/BIJKdAGoyNxjD1MAkcecW9UiPRkYtDQ7Kug0Z8Oe5u47vdjE
	4puzWbr0QFdHjWHtMOVJnjgvGQFVg8k=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-417-ckHjFNQlNACn5d-TYDy0Lg-1; Sat,
 04 Apr 2026 04:03:07 -0400
X-MC-Unique: ckHjFNQlNACn5d-TYDy0Lg-1
X-Mimecast-MFC-AGG-ID: ckHjFNQlNACn5d-TYDy0Lg_1775289787
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C6601195608F
	for <llvm@lists.linux.dev>; Sat,  4 Apr 2026 08:03:06 +0000 (UTC)
Received: from [172.20.155.76] (unknown [10.30.44.186])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 616303000223;
	Sat,  4 Apr 2026 08:03:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-rc6,
 upstream-mainline, 631919fb)
Date: Sat, 04 Apr 2026 08:03:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <35687.126040404030700485@us-mta-417.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ytrLZ69IapSwAy_1ODRaALSmX7Ifxf0Qod9Ob5xQe5U_1775289787
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'sched_ext-for-7.0-rc6-fixes-2' of git://git.=
kernel.org/pub/scm/linux/kernel/git/tj/sched_ext

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2428699220

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2428699220_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: fedora rawhide - nfsv4.2 failed to update ctime when calling=
 futimens
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417851
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: xfstests nfsv4.2 generic/309 FAIL on 6.19.0 as "mtime not up=
dated" and "ctime not updated"
            URL: https://lore.kernel.org/linux-nfs/20251219175955.4480-1-ok=
orniev@redhat.com/
            Affected tests:
                xfstests - nfsv4.2 [x86_64]



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


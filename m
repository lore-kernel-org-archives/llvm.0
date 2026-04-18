Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7154E175A91
	for <llvm@lists.linux.dev>; Sat, 18 Apr 2026 11:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776513132; cv=none; b=rEZYpQBF7Uq/zqFsqClXBW+/qYqu71taDgvFznyPvsTNUovpzm3Qrk4DPX2r+RJsb9d6Bhqc+ZHgnhR4Z4+xMeM6qb0Pib0bocD9N5NKjZi/uALXUCIBoYlCwA1BrcW7royH3W53Zkr39TC0EkHlUMpHpChRXkT7YmJ8RrRaym8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776513132; c=relaxed/simple;
	bh=dRHoiywdRBlf6fC6IZOjihzYUVUBGICTChwYZQzaTc0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=sgocLZ8qg8ttCH7SSBZuV+OSwMwvShL7rr4e1COvUM6Enu6V6Nj1rfj/h5Ml36TJHAgDItA/feui1xVSmYDUcs+VCTAjXeEitXU+Qo6if+RLgRbCLcAbZP+LpLXqaKF5+fU3O9c7bjEdd+nsk+7f4eSaxeN8HDApUM6G8lAHVK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PI94j4VH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PI94j4VH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776513129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b1edV8i4wXFHns3n9gCqjHrPMID1JtVRJrNrU4LLu9Q=;
	b=PI94j4VHBy61fFGACmQqsmpfqcS+q27qC9pJoWPVeXP2jOkJytp+FQH10kI64zN9egg8Zr
	asFG9CxUlczXMmnLcVoA/Fs9UPzoncYwN20va3KHDPKgcNC2Zt8p8q6YIEXn1SUJf3+bl+
	WAlSTCocn9AjlYBX+27tX0XUySqUWnk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-532-qOGElsigPB22Xgh4PCkm_A-1; Sat,
 18 Apr 2026 07:52:07 -0400
X-MC-Unique: qOGElsigPB22Xgh4PCkm_A-1
X-Mimecast-MFC-AGG-ID: qOGElsigPB22Xgh4PCkm_A_1776513127
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 138D1180057D
	for <llvm@lists.linux.dev>; Sat, 18 Apr 2026 11:52:07 +0000 (UTC)
Received: from [172.20.96.14] (unknown [10.30.44.37])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AA12D195608E;
	Sat, 18 Apr 2026 11:52:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-0,
 upstream-mainline, 8541d8f7)
Date: Sat, 18 Apr 2026 11:52:06 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <10099.126041807520700555@us-mta-532.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9FG1n19OYP15TGkkYGA1vj3o8lXnWq4lu544oqN9Cw4_1776513127
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'mtd/for-7.1' of git://git.kernel.org/pub/scm=
/linux/kernel/git/mtd/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2461936247

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2461936247_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2461936247_x86_64_kernel_kcidb_tool_21129050_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
        xfstests - ext4
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2461936247_x86_64_kernel_kcidb_tool_21129050_7
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/406

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] [eln] waived call traces we don't plan to report =
upstream
            URL: https://redhat.atlassian.net/browse/RHELTEST-137
            Affected tests:
                Boot test [x86_64]
        Issue: [upstream] WARNING: drivers/gpu/drm/drm_atomic_helper.c:1920=
 at drm_atomic_helper_wait_for_vblanks.part.0+0x228/0x240, CPU#1: kworker/1=
:1/54 - RIP: 0010:drm_atomic_helper_wait_for_vblanks
            URL: https://lore.kernel.org/dri-devel/69381d6c.050a0220.4004e.=
0017.GAE@google.com/
            Affected tests:
                Boot test [x86_64]
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
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


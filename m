Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA9B8834
	for <llvm@lists.linux.dev>; Fri, 10 Jul 2026 18:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706593; cv=none; b=uFrWEnxypvfpPP21SQM+UjA2WrwqEqlqR5DkAyJY4E6pbNno4vQqVLsKrMkVTQ8GQeD1mXDRX7mQ6nx+hCtArntKBAifN1rSnmBDhf06gnUn8HhAAPFFT6xse5OR4+y1mEtsAjKlkVsi9/0EgRdShOmZXxadfJdYRe4U2xZyU8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706593; c=relaxed/simple;
	bh=kHSczUaxYyJKy4x0Mh/thB56zzFEh7JapxMlzvgW2qk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=EFq/aMjhijRczXNq9Hzej8cSz5355PZByH7UEr5yR9NzYKCk+WaLP/PdLGUCMnjv7ucO0mJ+TMOspeODFlbc1+QN9HnFmIm6SAaGliiIeLOHYauD9HtM0fM5lYDSmGGDB8OOkRLJDJgCq9EyiaUKHbcbjsGLof0mV69PGjJIL0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RnrjJxEr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RnrjJxEr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783706590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=42vmfm0JfrQ4ekvbLLvhjorEn9+ZiQXkC26JmaFSqbo=;
	b=RnrjJxErzKSx5Vhy8MhsYOiE6qgDnkLN7Xx9yFESeLh28JqLBzHQqPnDc86iAchIHEw5I+
	lG/9HqvtYR5yUHdMKXmEaKewjK3xgs9qbPFNu0llv8pb1FMadnPFnDbbM1pk7IZ2Agffg9
	frW+IW5CcJy+s/tPPM7HL958cY0hemk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-691-7jrQpA5xOGWXEFKwXnqEqg-1; Fri,
 10 Jul 2026 14:03:09 -0400
X-MC-Unique: 7jrQpA5xOGWXEFKwXnqEqg-1
X-Mimecast-MFC-AGG-ID: 7jrQpA5xOGWXEFKwXnqEqg_1783706588
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9141D1956068
	for <llvm@lists.linux.dev>; Fri, 10 Jul 2026 18:03:08 +0000 (UTC)
Received: from [172.20.146.15] (unknown [10.30.45.65])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E848F1955D71;
	Fri, 10 Jul 2026 18:03:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc2,
 upstream-mainline, a635d674)
Date: Fri, 10 Jul 2026 18:03:07 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <98963.126071014030910534@us-mta-691.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D_5zp38tYMo8nQ1OnwQ2gOMY6EzwqxvRakwkPLhLkp8_1783706588
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'v7.2-rc2-smb3-server-fixes' of git://git.sam=
ba.org/ksmbd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2666175242

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2666175242_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2666175242_x86_64_kernel_kcidb_tool_21616615_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2666175242_aarch64_kernel_kcidb_tool_21616845_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
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


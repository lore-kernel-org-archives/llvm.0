Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90FD274FFB
	for <llvm@lists.linux.dev>; Thu,  5 Jun 2025 19:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151390; cv=none; b=HLdHZ1agTX0ARlkeRJD2gtYw8iXfVx5OrFf3EGvi04v2W7Mkvzo90SVt+i27IR5N56ZVsb5L4CktOXZs2l976BpZ7+7BvpgywLZ7mL9NDiNEz8fkVis1DZIBv4I34JO7Qt1bXJq60N9FdgR4XKm8G5lQuE/J8gCUW6SxDr+pDhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151390; c=relaxed/simple;
	bh=EA+9WPGpgMyt2caBq2ogBFOj0Okt8hBfJm6hqaJ5+74=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=f1lA6h5iT5sFIl45A41KD9ntfOpCsdhkqJIKHJJcBckWxTY/C25QUVzGdZX+fewH+S1/bm5LmFgSjPGAUkd6Q799y4a/33QVP+wfy1GCAca+UkNSPP2iKj0r3jSU9ERkMq/ZfDKtEzQ2sRWU7qi4zQ4Vjp0LS1fLtfec2sWXLc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QsaoPcGA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QsaoPcGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749151387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5ilBc8Gp+hqgU5YgijUDEmV/6J9CprXtiCwpdha9Xno=;
	b=QsaoPcGAlOx3hh+4x7+DiqCFAR4bwQ94sVRnUQynXplzeHGV8TF3aAf0ysX0fq8elmx8Tk
	pIOh80w7CT0vm3S7qbpNQzZ4ot4vWlsPDowul6PbSaYYiirH+ZdWADVNWhZAjcPQOjHH6N
	uzihWYEiryxSKQJQQiZtR5tHiIHC5Fc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-247-zGSa1Z-wNQGZwvalAsIAtw-1; Thu,
 05 Jun 2025 15:23:06 -0400
X-MC-Unique: zGSa1Z-wNQGZwvalAsIAtw-1
X-Mimecast-MFC-AGG-ID: zGSa1Z-wNQGZwvalAsIAtw_1749151385
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A2D98195608A
	for <llvm@lists.linux.dev>; Thu,  5 Jun 2025 19:23:05 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EC92B18003FC;
	Thu,  5 Jun 2025 19:23:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 15 of 100): Test report for master
 (6.15.0, upstream-mainline, f5164456)
Date: Thu, 05 Jun 2025 19:23:04 -0000
To: fmaurer@redhat.com, haliu@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <95449.125060515230600949@us-mta-247.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3x5_MBU4QGvj5MfPXZ4yiKxZdfgLcM2u09u92H4hBC8_1749151385
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'xtensa-20250603' of https://github.com/jcmvb=
kbc/linux-xtensa

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1851486738

One or more kernel tests failed:
    Unrecognized or new issues:
        kselftest build - bpf
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1851486738-x86_64-kernel-debug_selftest_bpf

    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]


Tests that were not ran because of internal issues:
    Boot test [x86_64]
    CKI/restraint [x86_64]
    machineinfo [x86_64]
    Reboot test [x86_64]
    SELinux Custom Module Setup [x86_64]
    Storage - blktests - throtl [x86_64]
    Storage - blktests - ublk [x86_64]
    stress: stress-ng - cpu-cache [x86_64]
    stress: stress-ng - memory [x86_64]
    xfstests - btrfs [x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [x86_64]


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


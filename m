Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC6A23D7C4
	for <llvm@lists.linux.dev>; Thu, 11 Sep 2025 05:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757568737; cv=none; b=Mfs2zT5Yfx7nw0Q+Lt9xtYbfY2MZfwawjWYSEUKlaCgzCmhLVBcz9alIOYI/QUf3vEzzSKxL2K2ZRFeib81TzOw0Lj9u03ONFJthv7mvVPX9SoVAItsBGFe+ErLyilblj+0rSMncUWttgW4rofWdpd632T+A3ilZ5nCyrWOMbvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757568737; c=relaxed/simple;
	bh=I2dgBNDE2BIw99xmb2jcp7bFg7Af6bflHKDWWcQvZO0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=iv/U4DO7JXgPWg5u6SSkQW6t5PCxO+qnph8HFeM1yamYALQGA+I/szProksUjZtNjehm+4puwtWwICI4Om+boq7bbHBkQFKVNRLumpRhQt0DYVikxHkeiKR1w6Xc5J4oh+7x6lbFwEpg3DHpbF1+05wjHZ/miqGsLKLNOyhu1nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bK55z8oI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bK55z8oI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757568733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nt3VQynD9HNbfB8MHx/snEu9a5Epk41vkA4mNHYPnio=;
	b=bK55z8oIb8kytvXgCR/q+rdnQ4vRDkuu3qvV3mpb9F1iijlC1stcqQjack5YNlQDPkaNvX
	ZgCbGlp913/meVaiqmCVvPDWTVGY9IGnuQY0nk10LT4eDgOWYbu8Vafztxb0M6DSS6lUbX
	VBxcl12xobJJPrfCV9Vn/A9Qt6cMRr8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-28-LXVjP2HXPVqRiRJ91QdJOw-1; Thu,
 11 Sep 2025 01:32:12 -0400
X-MC-Unique: LXVjP2HXPVqRiRJ91QdJOw-1
X-Mimecast-MFC-AGG-ID: LXVjP2HXPVqRiRJ91QdJOw_1757568731
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 600311956087
	for <llvm@lists.linux.dev>; Thu, 11 Sep 2025 05:32:11 +0000 (UTC)
Received: from [172.20.141.126] (unknown [10.30.44.25])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9DB09300018D;
	Thu, 11 Sep 2025 05:32:10 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.17.0-rc5,
 upstream-mainline, 7aac7190)
Date: Thu, 11 Sep 2025 05:32:10 -0000
To: ftjahjad@redhat.com, llvm@lists.linux.dev, bgoncalv@redhat.com,
 yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <28492.125091101321200985@us-mta-28.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d8ePGLQ5UOtFUxRUU4i1kNASrXHhkBNOUZA1aHEJhpM_1757568731
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'nfs-for-6.17-3' of git://git.linux-nfs.org/p=
rojects/trondmy/linux-nfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2032895035

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2032895035_s390x_kernel_kcidb_tool_19554643_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2032895035_s390x_kernel_kcidb_tool_19554644_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2032895035_aarch64_kernel_kcidb_tool_19554636_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2032895035_aarch64_kernel_kcidb_tool_19554637_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2032895035_x86_64_kernel_kcidb_tool_19554640_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2032895035_x86_64_kernel_kcidb_tool_19554641_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2032895035_ppc64le_kernel_kcidb_tool_19555393_7
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2032895035_x86_64_kernel-debug_kcidb_tool_19554645_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2032895035_x86_64_kernel-debug_kcidb_tool_19554772_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Reboot test
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2032895035_s390x_kernel_kcidb_tool_19554643_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2032895035_s390x_kernel_kcidb_tool_19554644_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2032895035_aarch64_kernel_kcidb_tool_19554636_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2032895035_aarch64_kernel_kcidb_tool_19554637_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2032895035_x86_64_kernel_kcidb_tool_19554640_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2032895035_x86_64_kernel_kcidb_tool_19554641_12
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2032895035_ppc64le_kernel_kcidb_tool_19555393_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2032895035_x86_64_kernel-debug_kcidb_tool_19554645_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2032895035_x86_64_kernel-debug_kcidb_tool_19554772_12
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2032895035_x86_64_kernel_kcidb_tool_19554641_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2032895035_x86_64_kernel-debug_kcidb_tool_19554772_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [aarch64][coresight_etm4x][kernel 5.19.0] coresight-etm4x: p=
robe of ARMHC500:20 failed with error -17
            URL: https://lore.kernel.org/all/CA+QYu4ogiTa1V20aqxFqBrMH0z927=
YNNN2O=3DCKma+=3DM_8E81iQ@mail.gmail.com/
            Affected tests:
                Boot test [aarch64]
                Reboot test [aarch64]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]



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


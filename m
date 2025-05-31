Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326F9208A7
	for <llvm@lists.linux.dev>; Sat, 31 May 2025 06:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748674396; cv=none; b=tPM++P62omkUufpNRLTSmwZnOBvBRdNMMn1eODCE5lJoQTW4CjjALjG6aMKkIazvj7pw3PQ6R4maainyTp27umHht25Eh8mgbgzr42PcehjKHMlHTn1qkG6CV8St+ik15xdudZciKeJbIT/qQ6mNzEf7vkFUxbwMniWu1WO9VhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748674396; c=relaxed/simple;
	bh=In6LKOC62oKPfjdy6ekfobuJfhJSQHNSLZN5KKLtVCk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=b0wx50I0+oJCJuO6meUvzCaBiQZOkqKp4rZ5sKbDdB5m0tMb8pNQRXzSCetMp2MYaLV1Q/XggMonYqenOKYN1bPSc7nAI8uR3Ua3qSl/gMjFHAbehk+79j6RbYLbPAdt1PGRpb9BFGc/L+wijEZUgHtfJCehAAKCeVJomMEgclc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QLIIAX2R; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QLIIAX2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748674393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=79NqO9B5Insk/aAfY9IQkX7WSJG976ylEuyMUnhjwd8=;
	b=QLIIAX2RyZpNeC1Fpuw7Cv4VJemA98nxlWUIsvaflAXSBDDpk7F43xga9YMAW30bSU5h6z
	FZw2NYGIzo+j6ebkmKWjv0g+/AOBEObkmCkI9eaCWUV60SiCPmHhmMH68IzcE1dNY+eBAF
	qzW1CiKCxHDbdh2jn/KBnE8300bPj/U=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-175--BmtzPxLMqizT-uM1N5soA-1; Sat,
 31 May 2025 02:53:11 -0400
X-MC-Unique: -BmtzPxLMqizT-uM1N5soA-1
X-Mimecast-MFC-AGG-ID: -BmtzPxLMqizT-uM1N5soA_1748674390
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 947221956087
	for <llvm@lists.linux.dev>; Sat, 31 May 2025 06:53:10 +0000 (UTC)
Received: from [172.20.48.73] (unknown [10.30.45.91])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 17D811955D88;
	Sat, 31 May 2025 06:53:09 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 6 of 100): Test report for master
 (6.15.0, upstream-mainline, 8477ab14)
Date: Sat, 31 May 2025 06:53:08 -0000
To: mmalik@redhat.com, fmaurer@redhat.com, haliu@redhat.com,
 omosnace@redhat.com, bgoncalv@redhat.com, ftjahjad@redhat.com,
 llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <08725.125053102531100485@us-mta-175.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dM0_44wXAuvo8MJV9wtiHMBnNQvXaIMqaKl13-EZPs4_1748674390
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'iommu-updates-v6.16' of git://git.kernel.org=
/pub/scm/linux/kernel/git/iommu/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1845190515

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1845190515-x86_64-kernel-debug_upt_4
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        kselftest build - bpf
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1845190515-x86_64-kernel-debug_selftest_bpf
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1845190515-x86_64-kernel-debug_upt_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        selinux-policy: serge-testsuite
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1845190515-ppc64le-kernel_upt_5
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [aarch64][coresight_etm4x][kernel 5.19.0] coresight-etm4x: p=
robe of ARMHC500:20 failed with error -17
            URL: https://lore.kernel.org/all/CA+QYu4ogiTa1V20aqxFqBrMH0z927=
YNNN2O=3DCKma+=3DM_8E81iQ@mail.gmail.com/
            Affected tests:
                Boot test [aarch64]
                Reboot test [aarch64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]


Tests that were not ran because of internal issues:
    Reboot test [x86_64]
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


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C43C3AD52A
	for <llvm@lists.linux.dev>; Mon,  6 Jul 2026 03:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783308731; cv=none; b=tFddcfBZ+ZD1CbMv2mD8avgVTPLbuH5P2Mov03OzzvxYQh7tfhaJeNdCOlq1dhG1T/zxsnkLEL8MsLJHJITsHUTvDD8+BCiG8c7dH7PE4b4VgK+KRaKTalZ2M6LTx6soBmzG6wZ2FRfnnci/pAW2SrAiyRO6d6zxVAIsT3GVNDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783308731; c=relaxed/simple;
	bh=rUhCOqNoLKUXIFew7o8ignLw2W3iE7LiGp7CrwqkFUk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=E7HWjVWCK5QnBEk8B88JRJ5rWmoQGQ94LvcZAvVWsv/pf3KaHyKPOGrPzMq86UT96fRASpcPhqzlnkApbBD9MjCyJaZ/6edl5aon+mrIrjUOk3f43FIzEH9X500D9IWp9fL5H8JnE88RKET/j1RflB3jRNaAgWmyDuSYIjAVO88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PkECHDww; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PkECHDww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783308728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MHMtgrvIQ0+jT2ECKkkVJOMowa2Or5itHooFQGM3n5I=;
	b=PkECHDwwj8U8Un+nnlF+P21GPbNZaHB+g1Vpac+5TbXuptFUZXAP7AVovA7JcbAWiPmx7q
	CS7xyVKXrYCX6F1BSmCdmI5hTREIsWfaWV5n6z9t2NoNPTHoxonVLSZF8Ww9FWx4wuau1a
	nkF5jvIgk0gj4z9AtWVObSHA0o42SI4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-454-8TyyH6jSOW6bZXbQ-svkXg-1; Sun,
 05 Jul 2026 23:32:05 -0400
X-MC-Unique: 8TyyH6jSOW6bZXbQ-svkXg-1
X-Mimecast-MFC-AGG-ID: 8TyyH6jSOW6bZXbQ-svkXg_1783308724
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7F16C1800BEE
	for <llvm@lists.linux.dev>; Mon,  6 Jul 2026 03:32:04 +0000 (UTC)
Received: from [172.20.209.159] (unknown [10.30.45.50])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D90EC300070A;
	Mon,  6 Jul 2026 03:32:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc1,
 upstream-mainline, f105f363)
Date: Mon, 06 Jul 2026 03:32:03 -0000
To: ftjahjad@redhat.com, bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <62328.126070523320500744@us-mta-454.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xxE9liUOsHcONVlM1lCLXQkOGBQ7o-mVBkxKsEPhJPE_1783308724
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'x86-urgent-2026-07-05' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2653114143

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2653114143_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2653114143_aarch64_kernel_kcidb_tool_21585659_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2653114143_aarch64_kernel_kcidb_tool_21585659_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check



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


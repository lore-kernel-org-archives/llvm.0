Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2C028E7
	for <llvm@lists.linux.dev>; Sat,  1 Mar 2025 05:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740807747; cv=none; b=OOFINb1oCnTDx3xoVzEazO2KY5HPlb6QMGMLWd2Wl8UefjRBXdGWcyqFWcrt1/hBqXVu/YyeP5jiqP5CldULMT4e6Mbnp2gTHbNFxGFasuwS8MqFsB1oSMLY4yKCVyxEIYFffETqCF8kq2r7pyWsFMCIX/r9AKHut4xED9T7OXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740807747; c=relaxed/simple;
	bh=1asPXkcb7f54vcgiik8iZOcCoqvZzkNtpYqcuOjxe30=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=RMPDlcwp+dNOSAYzat+IwIKiyVmHiTPmVXV3D/8hZUL2T7afIlo5Us8WAshhTqMJpqUbMKEcmOqjkX1M6ksDhqZ3msrysv0IM8kzBfAlpLYb1ND90bnO7FptwTjgU3QJ2fzSyzM0Y7KtCwKlkafw5NEOjS4DpukHJGxMZRMGn50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HNH+VLuR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HNH+VLuR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740807742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NsC+GeztX4iJ+WtIO7Ma03sZPHNxUH8pB9ROb7w7aLw=;
	b=HNH+VLuRuTGZcaTX03Jq+bxU9yE52wrLtB5OX3Rb7zoARI9GhntPYDzKvpc4ukd/trkzlN
	8TLLhKc/9d2UT+usHmE50/EsqaV/8Pr11Nes3huXI7rsLkyIXoL4wGbtDdlP210HAgW8QD
	27cLbvKngUE9nPKEdaC9jg8vD4TqzTg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-149-YLRmgbr8OlGKIfFZBtMixg-1; Sat,
 01 Mar 2025 00:42:09 -0500
X-MC-Unique: YLRmgbr8OlGKIfFZBtMixg-1
X-Mimecast-MFC-AGG-ID: YLRmgbr8OlGKIfFZBtMixg_1740807728
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7E81A1800374
	for <llvm@lists.linux.dev>; Sat,  1 Mar 2025 05:42:08 +0000 (UTC)
Received: from [172.64.10.27] (unknown [10.30.34.106])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DDE7F1800367;
	Sat,  1 Mar 2025 05:42:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc4,
 upstream-mainline, 03d38806)
Date: Sat, 01 Mar 2025 05:42:07 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <85911.125030100420900683@us-mta-149.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TEYNxkATvvpac_GZaFKL5bF-4zozfISRDzaoqRX1LrU_1740807728
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'thermal-6.14-rc5' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1694397217

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1694397217-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1694397217-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1694397217-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3234249E5
	for <llvm@lists.linux.dev>; Tue,  2 Sep 2025 22:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756852333; cv=none; b=hzRXGLpo6fnzt42l64fbqWvMlpdt3a4Lzrq/TYJC6CY3Fjker74dmzu4y49OmZwVX2HdyVLbuQEeM7Ty7z0uy2MMLI0W+lHnpJ9b4yV5M5lMjcDEgFFs/+/8Zo7z8dlYOeI25e1OSFEd5qOVmpl3xRzkya8z1v4vVbBnBfBgCEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756852333; c=relaxed/simple;
	bh=MFGh8A84Lba3ftPajjqGf0krP3NFed+ZW/A/Y7/vF1o=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=GNxyTt3Jn0BFOybz2f8FxeTLeX1/C/XKjSpLAwe3QIicn1YxmWv48CwwRyFdwlWfUb6L9mAS9c+9MjNP9sQdVhpi18IJkgf2L0Y5mBYHfUrJH16pGZuykSkGRTdPpcDJVS/e3INiW4uyO4K3FeGSYrAOyyngeVJT/8ItXVQdU0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DVTL94Fc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DVTL94Fc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756852329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RtbhxscjWhaH2JL2yauGDnJRtlui29DkQaEAHfXBc1E=;
	b=DVTL94FcMbQOqa70WhzKYY+2eXph4VKy8mnJ5nYGyYa05Iz0DulEkbqiHblUEJhWHABpAK
	o78BRUzce/p2wHZS22bvQofZBhbpZzrReaAAAKdRCHpm/mdFY3KInd5ZPD1DLZnDvYolsH
	2h2DPEmUY49y8BzkQXZOAIeEu9ITBpA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-363-E4fqojtgMreQ1LUd9TObtg-1; Tue,
 02 Sep 2025 18:32:08 -0400
X-MC-Unique: E4fqojtgMreQ1LUd9TObtg-1
X-Mimecast-MFC-AGG-ID: E4fqojtgMreQ1LUd9TObtg_1756852327
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5E1BD1800352
	for <llvm@lists.linux.dev>; Tue,  2 Sep 2025 22:32:07 +0000 (UTC)
Received: from [172.20.143.215] (unknown [10.30.44.138])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DEECA19560AB;
	Tue,  2 Sep 2025 22:32:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (6.17.0-rc4,
 upstream-mainline, e6b9dce0)
Date: Tue, 02 Sep 2025 22:32:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <34680.125090218320800263@us-mta-363.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HX7_KCGIquZay45cIORti4fPmeoMn0jmYIzINMNgCWI_1756852327
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'sound-6.17-rc5' of git://git.kernel.org/pub/=
scm/linux/kernel/git/tiwai/sound

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2018116965

One or more kernel builds failed:
    We also see the following known issues which are not related to your ch=
anges:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2018116965_aarch64_kernel
                   Issue: upstream build: No rule to make target 'kernel.sb=
at' -> Update CONFIG_EFI_SBAT_FILE
                          https://gitlab.com/cki-project/infrastructure/-/i=
ssues/897
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2018116965_x86_64_kernel
                   Issue: upstream build: No rule to make target 'kernel.sb=
at' -> Update CONFIG_EFI_SBAT_FILE
                          https://gitlab.com/cki-project/infrastructure/-/i=
ssues/897
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2018116965_x86_64_kernel-debug
                   Issue: upstream build: No rule to make target 'kernel.sb=
at' -> Update CONFIG_EFI_SBAT_FILE
                          https://gitlab.com/cki-project/infrastructure/-/i=
ssues/897


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


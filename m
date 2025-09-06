Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7A628000D
	for <llvm@lists.linux.dev>; Sat,  6 Sep 2025 21:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757193790; cv=none; b=DUIRheZTphxznJrkHIhHpovXbpCMWvRw+ji5Yh8LK0l55EwDjZxTGMOTLraO0QlCavW7FVYBeLjJFCXWdz0GMaZF2Klih/T3TDf1ig3adMGuwAq/xRWQhoH7nM1XOmHKHpEvplXFcBWQTW6jIYCDm0mhfxjnng7LgK7xbdR52Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757193790; c=relaxed/simple;
	bh=o+KMqcGHXTYLSKlzOcghOYsj2tAeK0OgSlI+MYI4VrU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Agi0SRpDlHC1pWHJkWX+B/IngOBU+pr4keNr6DyC07y/MTOw2J3DmJjYylaEpLmSmp2O6Op/qhT7nEkva4lTmfkN0RjVoxXauoxGUjNp9YCo0/tIYSEnH3ffn0bKuyDfOx5BL0j1ypSvNkKk6YkN0FwExRvpKmjoKlphmKZApgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A1LY20M1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A1LY20M1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757193787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PL0EBh+EKnVnfcrmFWuC6OaI2qTmWZB6Y/V/Z/ynPZY=;
	b=A1LY20M1Cog+0kv9aczrriT8tBusm4QTqEminTqKRbE5jqrFIOQ1B9R6Iv08em8wCDXmCy
	5ou7xjdggcKRQThN5gjfjojQMQdtwtZmFaX9y/9WxW0QxH6naKMlRzxT1A3abZmmi5/4EZ
	pDAhW9FM0gj3vhdMuM0G03ERpByWjL8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-529-171W7lOlPeWHdl9COaTflQ-1; Sat,
 06 Sep 2025 17:23:06 -0400
X-MC-Unique: 171W7lOlPeWHdl9COaTflQ-1
X-Mimecast-MFC-AGG-ID: 171W7lOlPeWHdl9COaTflQ_1757193785
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8C5081956086
	for <llvm@lists.linux.dev>; Sat,  6 Sep 2025 21:23:05 +0000 (UTC)
Received: from [172.20.60.197] (unknown [10.30.45.107])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1E42C19560B8;
	Sat,  6 Sep 2025 21:23:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (6.17.0-rc4,
 upstream-mainline, b2369207)
Date: Sat, 06 Sep 2025 21:23:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <63193.125090617230600126@us-mta-529.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r8zW1-wgksHQRLjd9mStUDxax0yvik5pSkXrlyki7mQ_1757193785
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'rust-fixes-6.17-2' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/ojeda/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2025539653

One or more kernel builds failed:
    We also see the following known issues which are not related to your ch=
anges:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2025539653_aarch64_kernel
                   Issue: upstream build: No rule to make target 'kernel.sb=
at' -> Update CONFIG_EFI_SBAT_FILE
                          https://gitlab.com/cki-project/infrastructure/-/i=
ssues/897
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2025539653_x86_64_kernel
                   Issue: upstream build: No rule to make target 'kernel.sb=
at' -> Update CONFIG_EFI_SBAT_FILE
                          https://gitlab.com/cki-project/infrastructure/-/i=
ssues/897
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2025539653_x86_64_kernel-debug
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


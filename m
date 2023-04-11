Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8284B20F0;
	Tue, 11 Apr 2023 05:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681189496; x=1712725496;
  h=date:from:cc:subject:message-id:mime-version;
  bh=FaUmKWZ78R4cN9SstdYutCCp5rmY+yQlpQp14h1CS5E=;
  b=Lk+X79+BAqMXjqxA/QQ6H7smPXv2Vv8Pn2P9zerQl6biDVhN3cbHGoX9
   zUDloivStEWCrtKf25o3/thiGx1ksM1Xr5GlsyLES1vQXANVEqfS6ByJo
   +ZMh1NKiseJhjc4UtpsKC2HsNDrR36Uu/KUO/cocVNyk4S2UNChSpWaRm
   6tEF4bD+y5PKBcA+pIzil6qZoga2HcxCQrKiGIVbzs5t3CdfjftnhUI9T
   W/9R2F+Y0hkv7cIHzDu+veymQWVK24SZ7zifGFXc1nSpmx9DVpvS+HNC0
   zyAUaxYj+sn/WiWy2Q/UOL7rWP9WW/GwIQ/ajwH47s9IMJgfZG3xc3V5e
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="323159641"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="323159641"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 22:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="681944072"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="681944072"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Apr 2023 22:04:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm6BZ-000Vxp-26;
	Tue, 11 Apr 2023 05:04:53 +0000
Date: Tue, 11 Apr 2023 13:04:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.10.y 272/9999]
 drivers/usb/gadget/composite.c:1656:30: warning: taking address of packed
 member 'wLength' of class or structure 'usb_ctrlrequest' may result in an
 unaligned pointer value
Message-ID: <202304111201.RVHxgTky-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
drivers/usb/gadget/composite.c: 1656:30: warning: taking address of packed
 member 'wLength' of class or structure 'usb_ctrlrequest' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
drivers/usb/gadget/legacy/dbgp.c: 353:30: warning: taking address of packed
 member 'wLength' of class or structure 'usb_ctrlrequest' may result in an
 unaligned pointer value [-Waddress-of-packed-member]
drivers/usb/gadget/legacy/inode.c: 1343:30: warning: taking address of packed
 member 'wLength' of class or structure 'usb_ctrlrequest' may result in an
 unaligned pointer value [-Waddress-of-packed-member]

TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   387078f9030cf336cd9fef521540db75b61615e0
commit: 7193ad3e50e596ac2192531c58ba83b9e6d2444b [272/9999] USB: gadget: detect too-big endpoint 0 requests
config: mips-randconfig-r026-20230409 (https://download.01.org/0day-ci/archive/20230411/202304111201.RVHxgTky-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64el-linux-gnuabi64
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=7193ad3e50e596ac2192531c58ba83b9e6d2444b
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout 7193ad3e50e596ac2192531c58ba83b9e6d2444b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/usb/gadget/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304111201.RVHxgTky-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/composite.c:704:16: warning: taking address of packed member 'wTotalLength' of class or structure 'usb_bos_descriptor' may result in an unaligned pointer value [-Waddress-of-packed-member]
           le16_add_cpu(&bos->wTotalLength, USB_DT_USB_EXT_CAP_SIZE);
                         ^~~~~~~~~~~~~~~~~
   drivers/usb/gadget/composite.c:720:17: warning: taking address of packed member 'wTotalLength' of class or structure 'usb_bos_descriptor' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   le16_add_cpu(&bos->wTotalLength, USB_DT_USB_SS_CAP_SIZE);
                                 ^~~~~~~~~~~~~~~~~
   drivers/usb/gadget/composite.c:745:17: warning: taking address of packed member 'wTotalLength' of class or structure 'usb_bos_descriptor' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   le16_add_cpu(&bos->wTotalLength, USB_DT_USB_SSP_CAP_SIZE(1));
                                 ^~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/composite.c:1656:30: warning: taking address of packed member 'wLength' of class or structure 'usb_ctrlrequest' may result in an unaligned pointer value [-Waddress-of-packed-member]
                           __le16 *temp = (__le16 *)&ctrl->wLength;
                                                     ^~~~~~~~~~~~~
   4 warnings generated.
--
>> drivers/usb/gadget/legacy/dbgp.c:353:30: warning: taking address of packed member 'wLength' of class or structure 'usb_ctrlrequest' may result in an unaligned pointer value [-Waddress-of-packed-member]
                           __le16 *temp = (__le16 *)&ctrl->wLength;
                                                     ^~~~~~~~~~~~~
   1 warning generated.
--
>> drivers/usb/gadget/legacy/inode.c:1343:30: warning: taking address of packed member 'wLength' of class or structure 'usb_ctrlrequest' may result in an unaligned pointer value [-Waddress-of-packed-member]
                           __le16 *temp = (__le16 *)&ctrl->wLength;
                                                     ^~~~~~~~~~~~~
   1 warning generated.


vim +1656 drivers/usb/gadget/composite.c

  1629	
  1630	/*
  1631	 * The setup() callback implements all the ep0 functionality that's
  1632	 * not handled lower down, in hardware or the hardware driver(like
  1633	 * device and endpoint feature flags, and their status).  It's all
  1634	 * housekeeping for the gadget function we're implementing.  Most of
  1635	 * the work is in config and function specific setup.
  1636	 */
  1637	int
  1638	composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
  1639	{
  1640		struct usb_composite_dev	*cdev = get_gadget_data(gadget);
  1641		struct usb_request		*req = cdev->req;
  1642		int				value = -EOPNOTSUPP;
  1643		int				status = 0;
  1644		u16				w_index = le16_to_cpu(ctrl->wIndex);
  1645		u8				intf = w_index & 0xFF;
  1646		u16				w_value = le16_to_cpu(ctrl->wValue);
  1647		u16				w_length = le16_to_cpu(ctrl->wLength);
  1648		struct usb_function		*f = NULL;
  1649		u8				endp;
  1650	
  1651		if (w_length > USB_COMP_EP0_BUFSIZ) {
  1652			if (ctrl->bRequestType == USB_DIR_OUT) {
  1653				goto done;
  1654			} else {
  1655				/* Cast away the const, we are going to overwrite on purpose. */
> 1656				__le16 *temp = (__le16 *)&ctrl->wLength;
  1657	
  1658				*temp = cpu_to_le16(USB_COMP_EP0_BUFSIZ);
  1659				w_length = USB_COMP_EP0_BUFSIZ;
  1660			}
  1661		}
  1662	
  1663		/* partial re-init of the response message; the function or the
  1664		 * gadget might need to intercept e.g. a control-OUT completion
  1665		 * when we delegate to it.
  1666		 */
  1667		req->zero = 0;
  1668		req->context = cdev;
  1669		req->complete = composite_setup_complete;
  1670		req->length = 0;
  1671		gadget->ep0->driver_data = cdev;
  1672	
  1673		/*
  1674		 * Don't let non-standard requests match any of the cases below
  1675		 * by accident.
  1676		 */
  1677		if ((ctrl->bRequestType & USB_TYPE_MASK) != USB_TYPE_STANDARD)
  1678			goto unknown;
  1679	
  1680		switch (ctrl->bRequest) {
  1681	
  1682		/* we handle all standard USB descriptors */
  1683		case USB_REQ_GET_DESCRIPTOR:
  1684			if (ctrl->bRequestType != USB_DIR_IN)
  1685				goto unknown;
  1686			switch (w_value >> 8) {
  1687	
  1688			case USB_DT_DEVICE:
  1689				cdev->desc.bNumConfigurations =
  1690					count_configs(cdev, USB_DT_DEVICE);
  1691				cdev->desc.bMaxPacketSize0 =
  1692					cdev->gadget->ep0->maxpacket;
  1693				if (gadget_is_superspeed(gadget)) {
  1694					if (gadget->speed >= USB_SPEED_SUPER) {
  1695						cdev->desc.bcdUSB = cpu_to_le16(0x0320);
  1696						cdev->desc.bMaxPacketSize0 = 9;
  1697					} else {
  1698						cdev->desc.bcdUSB = cpu_to_le16(0x0210);
  1699					}
  1700				} else {
  1701					if (gadget->lpm_capable)
  1702						cdev->desc.bcdUSB = cpu_to_le16(0x0201);
  1703					else
  1704						cdev->desc.bcdUSB = cpu_to_le16(0x0200);
  1705				}
  1706	
  1707				value = min(w_length, (u16) sizeof cdev->desc);
  1708				memcpy(req->buf, &cdev->desc, value);
  1709				break;
  1710			case USB_DT_DEVICE_QUALIFIER:
  1711				if (!gadget_is_dualspeed(gadget) ||
  1712				    gadget->speed >= USB_SPEED_SUPER)
  1713					break;
  1714				device_qual(cdev);
  1715				value = min_t(int, w_length,
  1716					sizeof(struct usb_qualifier_descriptor));
  1717				break;
  1718			case USB_DT_OTHER_SPEED_CONFIG:
  1719				if (!gadget_is_dualspeed(gadget) ||
  1720				    gadget->speed >= USB_SPEED_SUPER)
  1721					break;
  1722				fallthrough;
  1723			case USB_DT_CONFIG:
  1724				value = config_desc(cdev, w_value);
  1725				if (value >= 0)
  1726					value = min(w_length, (u16) value);
  1727				break;
  1728			case USB_DT_STRING:
  1729				value = get_string(cdev, req->buf,
  1730						w_index, w_value & 0xff);
  1731				if (value >= 0)
  1732					value = min(w_length, (u16) value);
  1733				break;
  1734			case USB_DT_BOS:
  1735				if (gadget_is_superspeed(gadget) ||
  1736				    gadget->lpm_capable) {
  1737					value = bos_desc(cdev);
  1738					value = min(w_length, (u16) value);
  1739				}
  1740				break;
  1741			case USB_DT_OTG:
  1742				if (gadget_is_otg(gadget)) {
  1743					struct usb_configuration *config;
  1744					int otg_desc_len = 0;
  1745	
  1746					if (cdev->config)
  1747						config = cdev->config;
  1748					else
  1749						config = list_first_entry(
  1750								&cdev->configs,
  1751							struct usb_configuration, list);
  1752					if (!config)
  1753						goto done;
  1754	
  1755					if (gadget->otg_caps &&
  1756						(gadget->otg_caps->otg_rev >= 0x0200))
  1757						otg_desc_len += sizeof(
  1758							struct usb_otg20_descriptor);
  1759					else
  1760						otg_desc_len += sizeof(
  1761							struct usb_otg_descriptor);
  1762	
  1763					value = min_t(int, w_length, otg_desc_len);
  1764					memcpy(req->buf, config->descriptors[0], value);
  1765				}
  1766				break;
  1767			}
  1768			break;
  1769	
  1770		/* any number of configs can work */
  1771		case USB_REQ_SET_CONFIGURATION:
  1772			if (ctrl->bRequestType != 0)
  1773				goto unknown;
  1774			if (gadget_is_otg(gadget)) {
  1775				if (gadget->a_hnp_support)
  1776					DBG(cdev, "HNP available\n");
  1777				else if (gadget->a_alt_hnp_support)
  1778					DBG(cdev, "HNP on another port\n");
  1779				else
  1780					VDBG(cdev, "HNP inactive\n");
  1781			}
  1782			spin_lock(&cdev->lock);
  1783			value = set_config(cdev, ctrl, w_value);
  1784			spin_unlock(&cdev->lock);
  1785			break;
  1786		case USB_REQ_GET_CONFIGURATION:
  1787			if (ctrl->bRequestType != USB_DIR_IN)
  1788				goto unknown;
  1789			if (cdev->config)
  1790				*(u8 *)req->buf = cdev->config->bConfigurationValue;
  1791			else
  1792				*(u8 *)req->buf = 0;
  1793			value = min(w_length, (u16) 1);
  1794			break;
  1795	
  1796		/* function drivers must handle get/set altsetting */
  1797		case USB_REQ_SET_INTERFACE:
  1798			if (ctrl->bRequestType != USB_RECIP_INTERFACE)
  1799				goto unknown;
  1800			if (!cdev->config || intf >= MAX_CONFIG_INTERFACES)
  1801				break;
  1802			f = cdev->config->interface[intf];
  1803			if (!f)
  1804				break;
  1805	
  1806			/*
  1807			 * If there's no get_alt() method, we know only altsetting zero
  1808			 * works. There is no need to check if set_alt() is not NULL
  1809			 * as we check this in usb_add_function().
  1810			 */
  1811			if (w_value && !f->get_alt)
  1812				break;
  1813	
  1814			spin_lock(&cdev->lock);
  1815			value = f->set_alt(f, w_index, w_value);
  1816			if (value == USB_GADGET_DELAYED_STATUS) {
  1817				DBG(cdev,
  1818				 "%s: interface %d (%s) requested delayed status\n",
  1819						__func__, intf, f->name);
  1820				cdev->delayed_status++;
  1821				DBG(cdev, "delayed_status count %d\n",
  1822						cdev->delayed_status);
  1823			}
  1824			spin_unlock(&cdev->lock);
  1825			break;
  1826		case USB_REQ_GET_INTERFACE:
  1827			if (ctrl->bRequestType != (USB_DIR_IN|USB_RECIP_INTERFACE))
  1828				goto unknown;
  1829			if (!cdev->config || intf >= MAX_CONFIG_INTERFACES)
  1830				break;
  1831			f = cdev->config->interface[intf];
  1832			if (!f)
  1833				break;
  1834			/* lots of interfaces only need altsetting zero... */
  1835			value = f->get_alt ? f->get_alt(f, w_index) : 0;
  1836			if (value < 0)
  1837				break;
  1838			*((u8 *)req->buf) = value;
  1839			value = min(w_length, (u16) 1);
  1840			break;
  1841		case USB_REQ_GET_STATUS:
  1842			if (gadget_is_otg(gadget) && gadget->hnp_polling_support &&
  1843							(w_index == OTG_STS_SELECTOR)) {
  1844				if (ctrl->bRequestType != (USB_DIR_IN |
  1845								USB_RECIP_DEVICE))
  1846					goto unknown;
  1847				*((u8 *)req->buf) = gadget->host_request_flag;
  1848				value = 1;
  1849				break;
  1850			}
  1851	
  1852			/*
  1853			 * USB 3.0 additions:
  1854			 * Function driver should handle get_status request. If such cb
  1855			 * wasn't supplied we respond with default value = 0
  1856			 * Note: function driver should supply such cb only for the
  1857			 * first interface of the function
  1858			 */
  1859			if (!gadget_is_superspeed(gadget))
  1860				goto unknown;
  1861			if (ctrl->bRequestType != (USB_DIR_IN | USB_RECIP_INTERFACE))
  1862				goto unknown;
  1863			value = 2;	/* This is the length of the get_status reply */
  1864			put_unaligned_le16(0, req->buf);
  1865			if (!cdev->config || intf >= MAX_CONFIG_INTERFACES)
  1866				break;
  1867			f = cdev->config->interface[intf];
  1868			if (!f)
  1869				break;
  1870			status = f->get_status ? f->get_status(f) : 0;
  1871			if (status < 0)
  1872				break;
  1873			put_unaligned_le16(status & 0x0000ffff, req->buf);
  1874			break;
  1875		/*
  1876		 * Function drivers should handle SetFeature/ClearFeature
  1877		 * (FUNCTION_SUSPEND) request. function_suspend cb should be supplied
  1878		 * only for the first interface of the function
  1879		 */
  1880		case USB_REQ_CLEAR_FEATURE:
  1881		case USB_REQ_SET_FEATURE:
  1882			if (!gadget_is_superspeed(gadget))
  1883				goto unknown;
  1884			if (ctrl->bRequestType != (USB_DIR_OUT | USB_RECIP_INTERFACE))
  1885				goto unknown;
  1886			switch (w_value) {
  1887			case USB_INTRF_FUNC_SUSPEND:
  1888				if (!cdev->config || intf >= MAX_CONFIG_INTERFACES)
  1889					break;
  1890				f = cdev->config->interface[intf];
  1891				if (!f)
  1892					break;
  1893				value = 0;
  1894				if (f->func_suspend)
  1895					value = f->func_suspend(f, w_index >> 8);
  1896				if (value < 0) {
  1897					ERROR(cdev,
  1898					      "func_suspend() returned error %d\n",
  1899					      value);
  1900					value = 0;
  1901				}
  1902				break;
  1903			}
  1904			break;
  1905		default:
  1906	unknown:
  1907			/*
  1908			 * OS descriptors handling
  1909			 */
  1910			if (cdev->use_os_string && cdev->os_desc_config &&
  1911			    (ctrl->bRequestType & USB_TYPE_VENDOR) &&
  1912			    ctrl->bRequest == cdev->b_vendor_code) {
  1913				struct usb_configuration	*os_desc_cfg;
  1914				u8				*buf;
  1915				int				interface;
  1916				int				count = 0;
  1917	
  1918				req = cdev->os_desc_req;
  1919				req->context = cdev;
  1920				req->complete = composite_setup_complete;
  1921				buf = req->buf;
  1922				os_desc_cfg = cdev->os_desc_config;
  1923				w_length = min_t(u16, w_length, USB_COMP_EP0_OS_DESC_BUFSIZ);
  1924				memset(buf, 0, w_length);
  1925				buf[5] = 0x01;
  1926				switch (ctrl->bRequestType & USB_RECIP_MASK) {
  1927				case USB_RECIP_DEVICE:
  1928					if (w_index != 0x4 || (w_value >> 8))
  1929						break;
  1930					buf[6] = w_index;
  1931					/* Number of ext compat interfaces */
  1932					count = count_ext_compat(os_desc_cfg);
  1933					buf[8] = count;
  1934					count *= 24; /* 24 B/ext compat desc */
  1935					count += 16; /* header */
  1936					put_unaligned_le32(count, buf);
  1937					value = w_length;
  1938					if (w_length > 0x10) {
  1939						value = fill_ext_compat(os_desc_cfg, buf);
  1940						value = min_t(u16, w_length, value);
  1941					}
  1942					break;
  1943				case USB_RECIP_INTERFACE:
  1944					if (w_index != 0x5 || (w_value >> 8))
  1945						break;
  1946					interface = w_value & 0xFF;
  1947					buf[6] = w_index;
  1948					count = count_ext_prop(os_desc_cfg,
  1949						interface);
  1950					put_unaligned_le16(count, buf + 8);
  1951					count = len_ext_prop(os_desc_cfg,
  1952						interface);
  1953					put_unaligned_le32(count, buf);
  1954					value = w_length;
  1955					if (w_length > 0x0A) {
  1956						value = fill_ext_prop(os_desc_cfg,
  1957								      interface, buf);
  1958						if (value >= 0)
  1959							value = min_t(u16, w_length, value);
  1960					}
  1961					break;
  1962				}
  1963	
  1964				goto check_value;
  1965			}
  1966	
  1967			VDBG(cdev,
  1968				"non-core control req%02x.%02x v%04x i%04x l%d\n",
  1969				ctrl->bRequestType, ctrl->bRequest,
  1970				w_value, w_index, w_length);
  1971	
  1972			/* functions always handle their interfaces and endpoints...
  1973			 * punt other recipients (other, WUSB, ...) to the current
  1974			 * configuration code.
  1975			 */
  1976			if (cdev->config) {
  1977				list_for_each_entry(f, &cdev->config->functions, list)
  1978					if (f->req_match &&
  1979					    f->req_match(f, ctrl, false))
  1980						goto try_fun_setup;
  1981			} else {
  1982				struct usb_configuration *c;
  1983				list_for_each_entry(c, &cdev->configs, list)
  1984					list_for_each_entry(f, &c->functions, list)
  1985						if (f->req_match &&
  1986						    f->req_match(f, ctrl, true))
  1987							goto try_fun_setup;
  1988			}
  1989			f = NULL;
  1990	
  1991			switch (ctrl->bRequestType & USB_RECIP_MASK) {
  1992			case USB_RECIP_INTERFACE:
  1993				if (!cdev->config || intf >= MAX_CONFIG_INTERFACES)
  1994					break;
  1995				f = cdev->config->interface[intf];
  1996				break;
  1997	
  1998			case USB_RECIP_ENDPOINT:
  1999				if (!cdev->config)
  2000					break;
  2001				endp = ((w_index & 0x80) >> 3) | (w_index & 0x0f);
  2002				list_for_each_entry(f, &cdev->config->functions, list) {
  2003					if (test_bit(endp, f->endpoints))
  2004						break;
  2005				}
  2006				if (&f->list == &cdev->config->functions)
  2007					f = NULL;
  2008				break;
  2009			}
  2010	try_fun_setup:
  2011			if (f && f->setup)
  2012				value = f->setup(f, ctrl);
  2013			else {
  2014				struct usb_configuration	*c;
  2015	
  2016				c = cdev->config;
  2017				if (!c)
  2018					goto done;
  2019	
  2020				/* try current config's setup */
  2021				if (c->setup) {
  2022					value = c->setup(c, ctrl);
  2023					goto done;
  2024				}
  2025	
  2026				/* try the only function in the current config */
  2027				if (!list_is_singular(&c->functions))
  2028					goto done;
  2029				f = list_first_entry(&c->functions, struct usb_function,
  2030						     list);
  2031				if (f->setup)
  2032					value = f->setup(f, ctrl);
  2033			}
  2034	
  2035			goto done;
  2036		}
  2037	
  2038	check_value:
  2039		/* respond with data transfer before status phase? */
  2040		if (value >= 0 && value != USB_GADGET_DELAYED_STATUS) {
  2041			req->length = value;
  2042			req->context = cdev;
  2043			req->zero = value < w_length;
  2044			value = composite_ep0_queue(cdev, req, GFP_ATOMIC);
  2045			if (value < 0) {
  2046				DBG(cdev, "ep_queue --> %d\n", value);
  2047				req->status = 0;
  2048				composite_setup_complete(gadget->ep0, req);
  2049			}
  2050		} else if (value == USB_GADGET_DELAYED_STATUS && w_length != 0) {
  2051			WARN(cdev,
  2052				"%s: Delayed status not supported for w_length != 0",
  2053				__func__);
  2054		}
  2055	
  2056	done:
  2057		/* device either stalls (value < 0) or reports success */
  2058		return value;
  2059	}
  2060	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
